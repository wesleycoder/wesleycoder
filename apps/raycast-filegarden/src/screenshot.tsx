import { Clipboard, showToast, Toast } from '@raycast/api'
import { auth } from './auth.ts'
import { ensureScreenshotsFolder, uploadFile } from './files.ts'
import { screenCapture } from './screenCapture.ts'

export default async function Screenshot() {
  try {
    const filePath = await screenCapture()

    await auth()
    const parent = await ensureScreenshotsFolder()

    const url = await uploadFile(filePath, parent)
    await Clipboard.copy(url)

    await showToast({ style: Toast.Style.Success, title: 'URL copied to clipboard!' })
  } catch (e) {
    await showToast({
      style: Toast.Style.Failure,
      title: `Failed to upload screenshot: ${e instanceof Error ? e.message : String(e)}`,
    })
    return
  }
  return null
}
