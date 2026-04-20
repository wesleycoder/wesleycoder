# Nimoy Framework Architecture & Guidelines

## Project Identity & Core Mission

*Name:* Nimoy (Tribute to Leonard Nimoy. "Live long and prosper 🖖").

*Mission:* A lightweight, local-first, cross-platform desktop/mobile framework. Bridges a Vite-compatible web frontend (e.g., Astro) with a native Nim backend using OS-level WebViews.

*Target Audience:* Scalable from Learners (zero-config happy paths) to Experts (raw C/C++ interop).

*Anti-Goals:* Dependency bloat (RN/Tauri), heavy abstractions, forced boilerplate, pure server-side state (Datastar purism).

## Architectural Philosophy & Paradigms

### The "Resilient Datastar" Approach (Offline-First)

*Context:* Nimoy borrows the Server-Sent Events (SSE) streaming approach from Datastar, but explicitly rejects the "backend is the only source of truth" dogma.

*Rule:* The frontend MUST retain autonomy. It must be capable of offline execution, PWA empowerment, and resilient degradation when the backend/network is slow or unavailable.

*Messaging:* The architecture is message-based. High-speed, high-reliability, low-latency. SSE (HTTP) for server mode; direct IPC for native WebView mode.

### Framework Boundaries

*Frontend (UI):* Pure presentation. Framework-agnostic (Vite/Astro). Typescript generated via Nim macros.

*Backend (Native):* Nim. Handles business logic, SQLite (or Turso/libsql), and OS integrations.

*Bridge (IPC):* JSON over `window.__Nimoy.postMessage` (Native) or HTTP POST `/rpc` (Server).

### Core Mechanisms & API

### Remote Procedure Calls (RPC)

Backend functions are exposed to the frontend using the `{.expose.}` macro.

*Macro Behavior:* `{.expose.}` wraps a `proc` or `func`, handles JSON extraction, maps Nim types to TS types, and registers the handler in `rpcRegistry`.

*TS Generation:* `generateTsBindings(path)` reads the exposed procs and generates a type-safe TypeScript client using `rpc.tmpl.ts`.

*Nim Implementation Pattern:*

```nim
import nimoy, std/json

# 1. Define and expose
proc doSomething(input: string): JsonNode {.expose.} =
  # 2. Return JSON or throw exceptions (caught automatically by the bridge)
  if input.len > 10:
    raise newException(ValueError, "Input too long")
  return %*{"success": true, "echo": input}
```

### Server-to-Client Events (SSE / Native Dispatch)

The backend pushes data to the frontend using the `emit` function.

Native Mode: Uses `executeJS` to dispatch a `CustomEvent` (`_NIMOY:{eventName}`).

Server Mode: Uses HTTP Server-Sent Events (SSE).

Nim Implementation Pattern:

```nim
import nimoy

# Emit events from anywhere in the Nim backend
emit("status_update", %*{"progress": 50})
```

TypeScript Consumption:

```ts
import { listen } from './lib/rpc'

listen<{progress: number}>('status_update', (payload) => {
  console.log(payload.progress)
})
```

## Coding Guidelines for LLMs

When generating or modifying code for Nimoy, strictly adhere to these rules:

## Nim Backend Rules

Prefer `func` over `proc`: Use `func` (no side effects) by default. Use `proc` only when mutating global state or interacting with IO/FFI.

*Error Handling:* For RPC endpoints: It is acceptable to `raise newException(CatchableError, "msg")`. The expose macro captures these and sends a JSON error payload to the frontend.

*For internal logic:* Prefer returning Result types (if using nim-results) or Opt over throwing exceptions.

*Variable Initialization:* Avoid using the implicit `result` variable for accumulation. Prefer expression-based returns or explicit `return` statements with a locally scoped variable.

*Security by Default:* Apply Deno-like strictness to capabilities. Validate all JSON payload structures before processing.

*Simplicity:* Write straightforward, readable code. Avoid clever mathematical tricks or excessive macro usage unless absolutely necessary for the framework's core bridge.

## Frontend / TypeScript Rules

*Never manually edit `rpc.ts`:* It is auto-generated.

*Type Safety:* Rely on the generated RPC types. Do not use `any` unless mapping to an untyped `JsonNode` from Nim.

*State Management:* Local state is king. Fetch via RPC, mutate locally, sync optimistically. Do not wait for the backend to render the next frame if it can be avoided.

## Directory Structure Convention

*`apps/<app_name>/src/api/`:* Nim RPC endpoints (`*.nim`).

*`apps/<app_name>/src/<app_name>.nim`:* Main application entry point (Server/Webview initialization).

*`apps/<app_name>/src/lib/`:* Generated TS bindings (`rpc.ts`) and shared frontend logic.

*`pkgs/nimoy/src/nimoy.nim`:* The core framework library.

*`pkgs/nimoy/src/lib/`:* Internal framework mechanics (`rpc.nim`, `server.nim`, `events.nim`).

## Security & Constraints

*Network:* In server mode, restrict origins. Assume IPC inputs in native mode are trusted but structurally untyped (always validate JSON bounds).

*Dependencies:* Prefer Nim standard library or stew (Status corp utilities). Do not add heavy C++ dependencies unless explicitly instructed. Lean on the OS via lightweight C headers.
