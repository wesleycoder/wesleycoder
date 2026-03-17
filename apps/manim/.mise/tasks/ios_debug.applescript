#!/usr/bin/env osascript
#MISE description="Opens the Safari Web Inspector to debug the iOS app"
try
  activate application "Safari"
  delay 0.5
  tell application "System Events"
    tell process "Safari"
      set frontmost to true
      set devMenuBarItem to menu bar item "Develop" of menu bar 1
      click devMenuBarItem
      delay 0.2
      set simReady to false
      repeat 10 times
        if exists (first menu item of menu "Develop" of devMenuBarItem whose name contains "Simulator") then
          set simReady to true
          exit repeat
        end if
        delay 0.1
      end repeat
      if not simReady then error "Simulator menu item never loaded."
    end tell
  end tell

  tell application "System Events"
    tell process "Safari"
      set currentSimItem to first menu item of menu "Develop" of devMenuBarItem whose name contains "Simulator"
      select currentSimItem
      key code 124 -- Right Arrow
      set allMatches to (every menu item of menu 1 of currentSimItem whose name contains "Manim")
      set matchCount to count of allMatches
      key code 53 -- Escape
      delay 0.2
      repeat with i from 1 to matchCount
        click devMenuBarItem
        delay 0.1
        set currentSimItem to first menu item of menu "Develop" of devMenuBarItem whose name contains "Simulator"
        select currentSimItem
        delay 0.1
        key code 124 -- Right Arrow
        delay 0.1
        if i > 1 then
          repeat i times
            key code 125 -- Down Arrow
            delay 0.1
          end repeat
        end if
        key code 36 -- Enter
        delay 0.5
      end repeat
    end tell
  end tell
  return "✅ Debug run finished."
on error errMsg
  tell application "System Events" to key code 53 -- Escape
  return "❌ Error: " & errMsg
end try
