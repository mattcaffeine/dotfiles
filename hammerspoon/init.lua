-- Hammerspoon configuration, heavily influenced by sdegutis default configuration

-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 8
hs.grid.GRIDHEIGHT = 8

-- disable animation
hs.window.animationDuration = 0


-- hotkey mash
local mash   = {"ctrl", "cmd"}
--local mash_app   = {"cmd", "alt", "ctrl"}
local mash_shift = {"ctrl", "cmd", "shift"}


--
-- replace caffeine
--
local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    local result
    if state then
        result = caffeine:setIcon("~/.hammerspoon/caffeine-on.pdf")
    else
        result = caffeine:setIcon("~/.hammerspoon/caffeine-off.pdf")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

hs.hotkey.bind(mash, "/", function() caffeineClicked() end)
--
-- /replace caffeine
--

--------------------------------------------------------------------------------

-- application help
local function open_help()
  help_str1 = "1 - Terminal, 2- Browser, 3 - Atom, 4 - Radar"
  help_str2 = "5- Dash, 9- iTunes, M - Maximize"
  help_str3 = "YUIO - Resize, HJKL - Move - (shift)HJKL - Focus, NP - Next/Prev Screen" ..
            ". - Window Hints, 0 - Help"
  hs.alert.show(
   help_str1, 4)
  hs.alert.show(
   help_str2, 4)
  hs.alert.show(
   help_str3, 4)
end

-- Launch applications
hs.hotkey.bind(mash, '1', function () hs.application.launchOrFocus("iterm") end)
hs.hotkey.bind(mash, '2', function () hs.application.launchOrFocus("Chromium") end)
hs.hotkey.bind(mash, '3', function () hs.application.launchOrFocus("Atom") end)
hs.hotkey.bind(mash, '4', function () hs.application.launchOrFocus("Radar") end)
hs.hotkey.bind(mash, '5', function () hs.application.launchOrFocus("Dash") end)
hs.hotkey.bind(mash, '9', function () hs.application.launchOrFocus("iTunes") end)
hs.hotkey.bind(mash, '0', open_help)

-- global operations
hs.hotkey.bind(mash, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", function() hs.fnutil.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- adjust grid size
hs.hotkey.bind(mash, '=', function() hs.grid.adjustWidth( 1) end)
hs.hotkey.bind(mash, '-', function() hs.grid.adjustWidth(-1) end)
hs.hotkey.bind(mash, ']', function() hs.grid.adjustHeight( 1) end)
hs.hotkey.bind(mash, '[', function() hs.grid.adjustHeight(-1) end)

-- change focus
hs.hotkey.bind(mash_shift, 'H', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(mash_shift, 'L', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(mash_shift, 'K', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mash_shift, 'J', function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

-- multi monitor
hs.hotkey.bind(mash, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'P', hs.grid.pushWindowPrevScreen)

-- move windows
hs.hotkey.bind(mash, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'L', hs.grid.pushWindowRight)

-- resize windows
hs.hotkey.bind(mash, 'Y', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, 'U', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mash, 'I', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, 'O', hs.grid.resizeWindowWider)

-- Window Hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)

-- Screensaver
hs.hotkey.bind(mash, 'f12', function() hs.caffeinate.startScreensaver() end)

-- Reload Config
--hs.hotkey.bind(mash, 'R', hs.reload)


--
-- Monitor and reload config when required
--
function reload_config(files)
  caffeine:delete()
  hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")
--
-- /Monitor and reload config when required
--
