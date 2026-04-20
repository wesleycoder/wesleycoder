# Wés's monorepo

Here is where I keep all my personal projects while they are in their experimental phase and don't have their own branding defined.

## LLM context bloat

While this helps me to jump in and out of projects quickly, keeping a lot of unrelated projects together frequently leads to LLM context bloat.

For that I say "deal with it!", as soon as the projects are more mature they will own their own repository with related content and you will be happier to contribute there instead of jumping in here while I haven't fleshed out the project yet.

I don't rely on LLMs to do my work and having this monorepo does not hurt me and helps me to have a broad view of what needs to be done.

## Folder structure

- [`/apps/<project>`](./apps): Individual app projects
  - `/mise.toml`: Project's Mise configuration file
- [`/pkgs/<project>`](./pkgs): Shared packages and utilities
  - `/mise.toml`: Package's Mise configuration file
- [`/mise.toml`](./mise.toml): Main Mise configuration file
- [`/bin/*`](./bin): Miscelaneous executable scripts

## Projects

### Nimoy

- [`pkgs/nimoy`](./pkgs/nimoy): Nimoy is a cross-platform full-stack framework for Nim
  - [`pkgs/nimoy/ARCHITECTURE.md`](./pkgs/nimoy/ARCHITECTURE.md): Project's overview
