# Rectangle.spoon

Move and resize windows.
Inspired by [Rectangle](https://github.com/rxhanson/Rectangle) app.

## Install
```bash
mkdir -p ~/.hammerspoon/Spoons
git clone https://github.com/gnudad/Rectangle.spoon.git ~/.hammerspoon/Spoons/Rectangle.spoon
```

## Configure
Add to `~/.hammerspoon/init.lua`
```lua
local mods = { "ctrl", "cmd" }

hs.loadSpoon("Rectangle"):bindHotkeys({
  left_half    = { mods, "a" },
  right_half   = { mods, "d" },
  center_half  = { mods, "s" },
  top_half     = { mods, "w" },
  bottom_half  = { mods, "x" },
  top_left     = { mods, "q" },
  top_right    = { mods, "e" },
  bottom_left  = { mods, "z" },
  bottom_right = { mods, "c" },
  maximize     = { mods, "f" },
  almost_max   = { mods, "g" },
  smaller      = { mods, "-" },
  larger       = { mods, "=" },
  center       = { mods, "0" },
})
```
