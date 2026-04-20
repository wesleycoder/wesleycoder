import { getPreferenceValues, LocalStorage } from '@raycast/api'
import { Buffer } from 'node:buffer'
import fs from 'node:fs/promises'
import { auth, get, getUserEndpoint } from './filegardenApi.ts'

enum Privacy {
  Public,
  Unlisted,
  Private,
}

export type File = {
  id: string
  type: string
  name: string
  path: string
  date: number
  size: number
  privacy: Privacy
  parent: string | null
}

export async function getContents(parent: string | null = null) {
  await auth()

  const data = await get<{ items: File[] }>(await getUserEndpoint(`/pipe?parent=${parent ?? ''}`))

  return data.items
}

export async function createFolder(name: string) {
  await auth()
  const cookie = await LocalStorage.getItem('filegarden_cookie') as string
  const userId = await LocalStorage.getItem('filegarden_userId') as string

  const res = await fetch(`https://api.filegarden.com/users/${userId}/pipe`, {
    headers: {
      cookie,
      accept: '*/*',
      'x-data': encodeURI(JSON.stringify({ parent: null, name, type: '/' })),
    },
    method: 'POST',
    body: null,
  })

  if (!res.ok) throw new Error(`Failed to create folder: ${res.statusText}`)
  const data = await res.json()

  if (!data?.id) throw new Error('Failed to create folder: no id returned')
  return data.id
}

export async function ensureScreenshotsFolder() {
  let parent = null
  await auth()
  const { screenshotsFolderId } = getPreferenceValues<Preferences>()
  if (screenshotsFolderId) {
    parent = screenshotsFolderId
  } else {
    const currentFolderId = await getFolderId('Screenshots')
    parent = currentFolderId ? currentFolderId : await createFolder('Screenshots')
  }
  await LocalStorage.setItem('filegarden_screenshotsFolderId', parent)

  return parent
}

export async function getFolderId(name: string, parent?: string) {
  await auth()
  const cookie = await LocalStorage.getItem('filegarden_cookie') as string
  const userId = await LocalStorage.getItem('filegarden_userId') as string
  const response = await fetch(`https://api.filegarden.com/users/${userId}/pipe?parent=${parent || ''}`, {
    method: 'GET',
    headers: {
      ...(cookie ? { cookie } : {}),
      'content-type': 'application/json',
    },
  })
  const data = await response.json()
  return data.items.find((f: { name: string }) => f.name === name)?.id as string | undefined
}

export async function uploadFile(filePath: string, parent: string | null = null) {
  await auth()
  const cookie = await LocalStorage.getItem('filegarden_cookie') as string
  const userId = await LocalStorage.getItem('filegarden_userId') as string
  const shortId = Buffer.from(userId, 'hex').toString('base64url')
  const dateTime = new Date().toISOString().replace(/[:.]/g, '-')

  const res = await fetch(`https://api.filegarden.com/users/${userId}/pipe`, {
    method: 'POST',
    headers: {
      cookie,
      'content-type': 'application/octet-stream',
      'x-data': encodeURI(JSON.stringify({ parent, name: `screenshot_${dateTime}.png` })),
    },
    body: await fs.readFile(filePath) as unknown as BodyInit,
  })

  if (res.status === 401) {
    await LocalStorage.removeItem('filegarden_cookie')
    await auth()
    return await uploadFile(filePath)
  }

  if (!res.ok) {
    throw new Error(`Upload failed: ${res.statusText}`)
  }

  const json = await res.json()

  return `https://file.garden/${shortId}/${json.path}`
}
