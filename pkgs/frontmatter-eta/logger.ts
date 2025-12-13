const logMethods = ['log', 'info', 'warn', 'error', 'debug']
const methodStyles: Record<(typeof logMethods)[number], string> = {
  log: 'color: cyan;',
  info: 'color: blue;',
  warn: 'color: orange;',
  error: 'color: red;',
  debug: 'color: gray;',
}

export const getPrefixedConsole = (prefix = '-', logger = globalThis.console) => {
  const handler: ProxyHandler<typeof console> = {
    get(target, prop, receiver) {
      const originalMethod = Reflect.get(target, prop, receiver)

      if (typeof originalMethod === 'function') {
        return (...args: unknown[]) => {
          const methodName = String(prop)
          let prefixedArgs = args

          if (logMethods.includes(methodName)) {
            prefixedArgs = [`%c[${prefix}:${methodName}]:`, methodStyles[methodName], ...args]
          }

          return Function.prototype.apply.call(originalMethod, target, prefixedArgs)
        }
      }

      return originalMethod
    },
  }

  return new Proxy(logger, handler)
}
