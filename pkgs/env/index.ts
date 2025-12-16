import { type TOptional, type TString, type TTransform, Type } from '@sinclair/typebox'
import { Value } from '@sinclair/typebox/value'
import { env as stdEnv } from 'std-env'
import { csvRegex } from './patterns.ts'

function reconstructObject(obj: Record<string, unknown>) {
  return Object.fromEntries(Object.getOwnPropertyNames(obj).map((key) => [key, obj[key]]))
}

const rawEnv = reconstructObject(stdEnv)

const csvHostnameSchema: TTransform<TString, string[]> = Type.Transform(Type.String({
  title: 'Hostname list',
  description: 'Comma-separated list of hostnames',
  examples: ['localhost', 'example.com', '127.0.0.1'],
  pattern: csvRegex.source,
})).Decode((v) => v.split(',').map((s) => s.trim())).Encode((v) => v.join(','))

const EnvSchema = {
  DEV_HOSTS: csvHostnameSchema,
}
type Env = Record<keyof typeof EnvSchema, string>
type EnvKey = keyof typeof EnvSchema

const PublicEnvSchema = {
  PUBLIC_DEV_HOSTS: Type.Optional(csvHostnameSchema) as TOptional<TTransform<TString, string[]>>,
}
type PublicEnv = Record<keyof typeof PublicEnvSchema, string>

const filteredEnv = Object.fromEntries(
  Object.entries(rawEnv)
    .filter(([key]) => Object.keys(EnvSchema).includes(key)),
) as Env

const filteredPubEnv = Object.fromEntries(
  Object.entries(rawEnv)
    .filter(([key]) => Object.keys(PublicEnvSchema).includes(key)),
) as PublicEnv

export const env: Env = new Proxy(filteredEnv, {
  get(target, prop) {
    if (/^(PUBLIC|VITE)_/.test(String(prop)) && !rawEnv.hasWindow) {
      throw new Error('Cannot access env non-public variables in browser')
    }
    return Value.Decode(EnvSchema[prop as EnvKey], Reflect.get(target, prop))
  },
})

export const publicEnv: PublicEnv = new Proxy(filteredPubEnv, {
  get(target, prop) {
    if (!/^(PUBLIC|VITE)_/.test(String(prop))) {
      return undefined
    }

    return Value.Decode(EnvSchema[prop as EnvKey], Reflect.get(target, prop))
  },
})

export default env

export {
  hasTTY,
  hasWindow,
  isBun,
  isCI,
  isColorSupported,
  isDebug,
  isDeno,
  isDevelopment,
  isEdgeLight,
  isFastly,
  isLinux,
  isMacOS,
  isMinimal,
  isNetlify,
  isNode,
  isProduction,
  isTest,
  isWindows,
  isWorkerd,
  nodeENV,
  nodeMajorVersion,
  nodeVersion,
  platform,
  type Process,
  process,
  provider,
  type ProviderInfo,
  providerInfo,
  type ProviderName,
  runtime,
  type RuntimeInfo,
  runtimeInfo,
  type RuntimeName,
} from 'std-env'
