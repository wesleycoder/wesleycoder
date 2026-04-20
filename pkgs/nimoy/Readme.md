# 🖖 Nimoy

`/ˈniːmɔɪ/ NEE-moy`

> Lightweight WebView-based cross-platform apps in Nim
>
> 🪶 🕸️👁️ 💻🐧🍏🪟📱🤖🍎 👑

Nimoy is a toolkit aiming to help you build cross-platform applications using web technologies while providing a very thin layer of abstraction leveraging the power of Nim on your backend.

## How it works

- You write your backend logic in Nim and your frontend using the framework of your choice.
- You decide what you expose via RPC (remote procedure calls via HTTPS) and what you ship inside the client to leverage the power of the users device.
- You use the `nimoy.ts` into your application to call your backend like would call any javascript functions.
- Nimoy bundles what it needs on the clients you need (web, desktop and mobile).
- `nimoy.ts` will automatically detect which resources are bundled in the app and which are remote and call them accordingly.

## The story

My background is strong on the JavaScript ecosystem going from jQuery, Knockout.js, Ember, Bower, Grunt, Gulp, AngularJS, passing through PHP, Python, Ruby, Ionic, Cordova, Node going to Typescript, React, React-Native, Next, Remix, Bun, Deno, Solid.js, Vite, and many other things that would be too much to list.

Feeling burnt out from most of the current state of software development and searching for more tools to fit into my umbrella, trying to deepen my knowledge in the direction of native development I've looked into Go, Rust, Elixir, Zig and even Kotlin and Dart as my next language.

I got short time exporing each of the options and got frustrated by the heavy syntax and overwhelmed by the effort needed to do simple things. Call it skill issues, I already have my self-doubts (or impostor syndrome) whatever, I don't care, I value simpler things highly.

The defining feature I was looking for was cross-platform web development with less boilerplate and abstractions than React-Native, Electron, Tauri or Wails.

I was already toying with webview within Deno and Bun with the prospect of using their compile to a single binary feature to deploy cross-platform.

By fate or accident I saw [this video from Code to the Moon](https://youtu.be/8V1TI16lHNs) appearing in my Youtube feed, it may not be the most complete introduction and it's the same style as most hype videos are, but being a new video made me think "oh, just what we needed, another new language...", but I was surprised to know it's in development since 2006 (maybe earlier), it was then that I got the faint rememberance of hearing of it half a dozen years ago and just ignoring it as I was deep into React hype.

Becoming curious about it's maturity and driven by the previous frustrations I did dedicate a lot of time into learning more about Nim's syntax, ecosystem and possibilities.

With some days submerged into it I started exploring what I could do with it. I was immediatelly drawn into it's interop layer and went looking for a webview lib, found one with a few issues that I could fix, started exploring, tried integrating macos features via objective-c, first time dealing with native things and Gemini was a big help there.

Within 2 days I had a semi-translucent borderless customizable window triggered by a system global shortcut mimicking what Raycast does. It only had an input and doing nothing but proved that I could start shipping native apps.

<!-- TODO: add early "Manim" screenshots here -->

Next steps were building to android, ios, then linux, windows, then adding a thin bridge to call nim code from within the webview.

At that point I was convinced this would be worth re-structuring and making something I could share, since my efforts to use Tauri, React-Native and others were bigger and with less results.

## Roadmap

Here is a loose list of features and development steps that are in my plan in no particular order.

If you think something here is of higher importance please let me know so I can prioritize it if possible.

- Vanilla JavaScript export
  - Currently we have a `.ts` export and that forces users to use typescript in their pipeline, ideally we could provide a `.js` export with JSDoc or a `.d.ts` companion file for vanilla usage with typesafety.
- Examples:
  - Vanilla (no-build): html, css, js
  - Astro
  - Vite+Solid
  - Vite+React (if you insist)
- Devtools:
  We should be able to expose a devtools interface to provide a list of endpoints and useful triggers to help develop applications.
  - Astro devtools integration
  - Vite plugin

---

## Software crafted with ❤️ by human hands

My software is made with the passion and care of a dedicated artisan.

This is why I use the word `craft` instead of `made` because I value the process, the craft itself.

I value my skills and hone my ability to stay useful to society, solving problems with my own effort is part of what makes me who I am.

I am not opposed to using AI as a tool and do reach to it when learning new skills or tackling challenging issues, but I do refuse to be lazy and let it take the wheel.

With that I do take ownership and responsibility for my work, it's results and effects in it's entirety, the *good* parts **and** the *bad* parts too.

If/when you find something wrong contained in my work, it either is on purpose or a genuine mistake on my part an it is directly my fault and responsibility do handle any effects it causes in the way I can as a human.

<a href="https://brainmade.org" target="_blank">
  <img alt="Brain Made"  src="./public/brain-made.svg" style="width: 150px;">
</a>
<a href="https://madebyhuman.iamjarl.com" target="_blank">
  <img alt="Made by Human" src="./public/made-by-human.svg" style="width: 150px;">
</a>
<a href="https://notbyai.fyi" target="_blank">
  <img alt="Not by AI" src="./public/by-human.svg" style="width: 150px;">
</a>
