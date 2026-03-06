type Platform = 'macosx' | 'ios' | 'android' | 'linux' | 'windows' | 'unknown'
type Browser =
  | 'chrome'
  | 'safari'
  | 'firefox'
  | 'edge'
  | 'brave'
  | 'vivaldi'
  | 'arc'
  | 'orion'
  | 'opera'
  | 'yandex'
  | 'ucbrowser'
  | 'samsung'
  | 'duckduckgo'
  | 'maxthon'
  | 'palemoon'
  | 'waterfox'
  | 'chromium'
  | 'silk'
  | 'qq'
  | 'baidu'
  | 'googlebot'
  | 'bingbot'
  | 'yandexbot'
  | 'baiduspider'
  | 'duckduckbot'
  | 'headlesschrome'
  | 'bot'
  | 'unknown'

interface HostInfo {
  platform: Platform
  arch: string
  browser: Browser
  browserVersion: string
  isMobile: boolean
}

declare global {
  interface Navigator {
    brave?: {
      isBrave: () => Promise<boolean>
    }
    userAgentData?: {
      platform: string
      mobile?: boolean
      getHighEntropyValues(hints: string[]): Promise<{
        architecture?: string
        fullVersionList?: { brand: string; version: string }[]
      }>
    }
  }
}

const matchers: { r: RegExp; b: Browser }[] = [
  { r: /googlebot\/([\d.]+)/, b: 'googlebot' },
  { r: /bingbot\/([\d.]+)/, b: 'bingbot' },
  { r: /yandexbot\/([\d.]+)/, b: 'yandexbot' },
  { r: /baiduspider\/([\d.]+)/, b: 'baiduspider' },
  { r: /duckduckbot\/([\d.]+)/, b: 'duckduckbot' },
  { r: /headlesschrome\/([\d.]+)/, b: 'headlesschrome' },
  { r: /(?:bot|spider|crawler)(?:\/([\d.]+))?/, b: 'bot' },
  { r: /(?:opr|opera)\/([\d.]+)/, b: 'opera' },
  { r: /yabrowser\/([\d.]+)/, b: 'yandex' },
  { r: /ucbrowser\/([\d.]+)/, b: 'ucbrowser' },
  { r: /samsungbrowser\/([\d.]+)/, b: 'samsung' },
  { r: /duckduckgo\/([\d.]+)/, b: 'duckduckgo' },
  { r: /maxthon\/([\d.]+)/, b: 'maxthon' },
  { r: /palemoon\/([\d.]+)/, b: 'palemoon' },
  { r: /waterfox\/([\d.]+)/, b: 'waterfox' },
  { r: /silk\/([\d.]+)/, b: 'silk' },
  { r: /qqbrowser\/([\d.]+)/, b: 'qq' },
  { r: /baidubrowser\/([\d.]+)/, b: 'baidu' },
  { r: /vivaldi\/([\d.]+)/, b: 'vivaldi' },
  { r: /edg(?:e|a|ios)?\/([\d.]+)/, b: 'edge' },
  { r: /orion\/([\d.]+)/, b: 'orion' },
  { r: /arc(?:web)?\/([\d.]+)/, b: 'arc' },
  { r: /chromium\/([\d.]+)/, b: 'chromium' },
  { r: /chrome\/([\d.]+)/, b: 'chrome' },
  { r: /firefox\/([\d.]+)/, b: 'firefox' },
  { r: /version\/([\d.]+).*safari/, b: 'safari' },
]

const targets: Browser[] = matchers.map((m) => m.b).concat('brave')

export const getHostInfo = async (ua: string = navigator.userAgent): Promise<HostInfo> => {
  const lowUA = ua.toLowerCase()

  const platform: Platform = /iphone|ipad|ipod/.test(lowUA)
    ? 'ios'
    : /android/.test(lowUA)
    ? 'android'
    : /macintosh|mac os x/.test(lowUA)
    ? 'macosx'
    : /windows|win32/.test(lowUA)
    ? 'windows'
    : /linux/.test(lowUA)
    ? 'linux'
    : 'unknown'

  let arch = /arm64|aarch64|applewebkit.*mobile/.test(lowUA) ? 'arm64' : /i686|i386|x86/.test(lowUA) ? 'x86' : 'amd64'

  let isMobile = platform === 'ios' || platform === 'android' || /mobile/.test(lowUA)

  let browser: Browser = 'unknown'
  let version = 'unknown'

  for (const { r, b } of matchers) {
    const m = lowUA.match(r)
    if (m) {
      browser = b
      version = m[1] || 'unknown'
      break
    }
  }

  if (navigator.userAgentData) {
    if (navigator.userAgentData.mobile !== undefined) {
      isMobile = navigator.userAgentData.mobile
    }

    try {
      const hints = await navigator.userAgentData.getHighEntropyValues([
        'architecture',
        'fullVersionList',
      ])

      if (hints.architecture) {
        arch = hints.architecture === 'arm' ? 'arm64' : hints.architecture === 'x86' ? 'x86' : 'amd64'
      }

      if (hints.fullVersionList) {
        for (const target of targets) {
          const match = hints.fullVersionList.find((b) => b.brand.toLowerCase().replace(/\s/g, '').includes(target))
          if (match) {
            browser = target
            version = match.version
            break
          }
        }
      }
    } catch (_e) {
      // noop
    }
  }

  if (browser === 'chrome' && navigator.brave) {
    try {
      if (await navigator.brave.isBrave()) {
        browser = 'brave'
      }
    } catch (_e) {
      // noop
    }
  }

  return {
    platform,
    arch,
    browser,
    browserVersion: version === 'unknown' ? 'unknown' : `/${version}`,
    isMobile,
  }
}
