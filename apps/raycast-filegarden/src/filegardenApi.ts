import { getPreferenceValues, LocalStorage } from '@raycast/api'

const BASE_URL = 'https://api.filegarden.com'

export async function getUserEndpoint(path: string) {
  let currentUrl = await LocalStorage.getItem('filegarden_current_url') as string || ''
  if (currentUrl) return `${currentUrl}${path}`
  await auth()
  const userId = await LocalStorage.getItem('filegarden_userId') as string || ''
  currentUrl = `${BASE_URL}/users/${userId}`
  await LocalStorage.setItem('filegarden_current_url', currentUrl)
  return `${currentUrl}${path}`
}

/**
 * Checks for a `set-cookie` header in the response and saves it to LocalStorage if present.
 */
async function updateCookie(res: Response) {
  const newCookie = res.headers.get('set-cookie')
  if (newCookie) {
    const authCookie = newCookie.split(';')[0]
    await LocalStorage.setItem('filegarden_cookie', authCookie)
    const userId = atob(decodeURIComponent(authCookie).replace('auth=s:', '').split('.')[0]).split(':')[0]
    await LocalStorage.setItem('filegarden_userId', userId)
  }
}

type JSONRequestParams = {
  headers?: Record<string, string>
  body?: object
}

type GETParams = Omit<JSONRequestParams, 'body'>
/**
 * Makes a GET request to the FileGarden API using the user's cookie.
 */
export async function get<T>(path: string, { headers }: GETParams = { headers: {} }): Promise<T> {
  const cookie = await LocalStorage.getItem('filegarden_cookie') as string || ''
  const res = await fetch(path, {
    headers: {
      'content-type': 'application/json',
      ...(cookie ? { cookie } : {}),
      ...headers,
    },
  })
  if (res.ok || res.status === 302) {
    await updateCookie(res)
    return res.json()
  } else {
    throw new Error(await res.text())
  }
}

type POSTParams = JSONRequestParams
/**
 * Makes a POST request to the FileGarden API using the user's cookie.
 */
export async function post<T>(path: string, { body, headers }: POSTParams = { headers: {} }): Promise<T> {
  const cookie = await LocalStorage.getItem('filegarden_cookie') as string || ''

  const res = await fetch(path, {
    method: 'POST',
    headers: {
      'content-type': 'application/json',
      ...(cookie ? { cookie } : {}),
      ...headers,
    },
    body: JSON.stringify(body),
  })
  if (res.ok || res.status === 302) {
    await updateCookie(res)
    return res.json()
  } else {
    throw new Error(await res.text())
  }
}

/**
 * Makes a POST request to the FileGarden API for token authentication.
 */
async function postToken({ email, password }: { email: string; password: string }) {
  const res = await fetch(`${BASE_URL}/token`, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify({ email, connection: `password ${btoa(password)}` }),
  })
  if (res.ok || res.status === 302) {
    await updateCookie(res)
    return res.json()
  } else {
    throw new Error(await res.text())
  }
}

export async function auth() {
  if (await LocalStorage.getItem('filegarden_cookie')) return

  const { email, password } = getPreferenceValues<Preferences>()
  await postToken({ email, password })

  if (!await LocalStorage.getItem('filegarden_cookie')) {
    throw new Error('Failed to authenticate with FileGarden. Check your preferences.')
  }
}
