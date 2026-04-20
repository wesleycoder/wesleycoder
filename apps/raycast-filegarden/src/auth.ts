import { getPreferenceValues, LocalStorage } from '@raycast/api'

export async function auth() {
  if (await LocalStorage.getItem('filegarden_cookie')) return

  const { email, password } = getPreferenceValues<Preferences>()

  const response = await fetch('https://api.filegarden.com/token', {
    method: 'POST',
    redirect: 'manual',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, connection: `password ${btoa(password)}` }),
  })

  if (response.ok || response.status === 302) {
    const rawCookie = response.headers.get('set-cookie')
    if (rawCookie) {
      const authCookie = rawCookie.split(';')[0]
      await LocalStorage.setItem('filegarden_cookie', authCookie)
      const userId = btoa(decodeURIComponent(authCookie).replace('auth=s:', '').split('.')[0]).split(':')[0]
      await LocalStorage.setItem('filegarden_userId', userId)
    }
  } else {
    throw new Error('Failed to authenticate with FileGarden. Check your preferences.')
  }
}
