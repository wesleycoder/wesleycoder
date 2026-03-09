declare global {
  interface Window {
    __ManimNative?: { postMessage: (payload: string) => Promise<unknown> }
    __MANIM__: {
      // deno-lint-ignore no-explicit-any
      callbacks: Record<string, ((...args: any[]) => void)[]>
      // deno-lint-ignore no-explicit-any
      on: (event: string, callback: (...args: any[]) => void) => void
      send: (event: string, data?: unknown) => Promise<unknown>
      emit: (event: string, data?: unknown) => void
    }
  }
}

globalThis.window.__MANIM__ = {
  callbacks: {},

  on(event, callback) {
    if (!this.callbacks[event]) this.callbacks[event] = []
    this.callbacks[event].push(callback)
  },

  async send(event, data) {
    const payload = JSON.stringify({ event, data })

    if (globalThis.window.__ManimNative) {
      const response = (await globalThis.window.__ManimNative.postMessage(payload)) as {
        event?: string
        data?: unknown
      } | undefined

      if (response?.event) {
        try {
          this.emit(response.event, response.data)
          return response
        } catch (e) {
          console.error('Failed when receiving native response', e)
        }
      } else {
        return response
      }
    } else {
      console.log(`[Web Fallback] Sent: ${event}`, data)
    }
  },

  emit(event, data) {
    if (this.callbacks[event]) {
      for (const cb of this.callbacks[event]) cb(data)
    }
  },
}

export const __MANIM__ = globalThis.window.__MANIM__
