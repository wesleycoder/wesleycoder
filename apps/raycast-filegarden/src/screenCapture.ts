import { exec } from 'node:child_process'
import fs from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'
import { promisify } from 'node:util'

const execAsync = promisify(exec)

export async function screenCapture() {
  const platform = os.platform()
  const tmpDir = os.tmpdir()
  const dateTime = new Date().toISOString().replace(/[:.]/g, '-')
  const filePath = path.join(tmpDir, `screenshot_${dateTime}.png`)

  switch (platform) {
    case 'darwin': {
      await execAsync(`/usr/sbin/screencapture -x -i "${filePath}"`)
      break
    }
    case 'win32': {
      const psCommand = `
        Add-Type -AssemblyName System.Windows.Forms;
        [System.Windows.Forms.SendKeys]::SendWait('{PRTSC}');
        Start-Sleep -Milliseconds 500;
        $img = [System.Windows.Forms.Clipboard]::GetImage();
        if ($img -ne $null) { $img.Save('${filePath}', [System.Drawing.Imaging.ImageFormat]::Png) }
      `
      await execAsync(`powershell -Command "${psCommand}"`)
      break
    }
    default: {
      throw new Error(`Unsupported platform: ${platform}`)
    }
  }

  try {
    await fs.access(filePath)
    return filePath
  } catch (e) {
    throw new Error(`Failed to save ${filePath}: ${e instanceof Error ? e.message : String(e)}`)
  }
}
