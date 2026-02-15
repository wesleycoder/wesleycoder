import webview
import os/macos/hotkeys
import os/macos/style

when isMainModule:
  let w = newWebview()
  w.setTitle "Manim"
  w.setSize(600, 400)

  w.setupHotkeys()

  w.setHtml """
  <style>
    body {
      background: transparent !important;
      margin: 0;
      padding-top: 36px; /* Space for the title bar */
      font-family: system-ui;
      color: white;
      height: 100vh;
      box-sizing: border-box;
    }
    h1 { margin: 0; font-weight: 300; text-shadow: 0 1px 3px rgba(0,0,0,0.3); }
    p { opacity: 0.8; }
    .content { padding: 20px; }
  </style>
  <body>
    <div class="content">
      <h1>Manim</h1>
      <p>Transparent. Vibrant. Draggable. Clickable.</p>
    </div>
  </body>
  """

  w.applyStyle(0.0, 0.12, 0.0, 0.3, true)

  w.run()
