local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Rectangle"
obj.version = "0.1"
obj.author = "gnudad <gnudad@icloud.com>"
obj.homepage = "https://github.com/gnudad/Rectangle.spoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:move(rect)
  hs.window.focusedWindow():moveToUnit(rect)
end

function obj:resize(delta)
  local frame = hs.window.focusedWindow():frame()
  local screen = hs.screen.mainScreen():fullFrame()
  if frame.w < screen.w then
    if frame.x + frame.w == screen.w then
      frame.x = frame.x - delta
    elseif frame.x > 0 then
      frame.x = frame.x - delta / 2
    end
    frame.w = math.min(frame.w + delta, screen.w)
  end
  if frame.h < screen.h - 50 then
    if frame.y + frame.h > screen.h - 50 then
      frame.y = frame.y - delta
    elseif frame.y > 50 then
      frame.y = frame.y - delta / 2
    end
    frame.h = math.min(frame.h + delta, screen.h)
  end
  -- Disable animation while resizing
  local animationDuration = hs.window.animationDuration
  hs.window.animationDuration = 0
  hs.window.focusedWindow():setFrame(frame)
  hs.window.animationDuration = animationDuration
end

function obj:center()
  local frame = hs.window.focusedWindow():frame()
  local screen = hs.screen.mainScreen():fullFrame()
  frame.x = (screen.w - frame.w) / 2
  frame.y = (screen.h - frame.h) / 2
  hs.window.focusedWindow():setFrame(frame)
end

local function bindSpecIf(bindSpec, pressedfn)
  if bindSpec == nil then return end
  hs.hotkey.bindSpec(bindSpec, pressedfn)
end

function obj:bindHotkeys(mapping)
  bindSpecIf(mapping.left_half,    function() self:move({0.0, 0.0, 0.5, 1.0}) end)
  bindSpecIf(mapping.right_half,   function() self:move({0.5, 0.0, 0.5, 1.0}) end)
  bindSpecIf(mapping.center_half,  function() self:move({0.2, 0.0, 0.6, 1.0}) end)
  bindSpecIf(mapping.top_half,     function() self:move({0.0, 0.0, 1.0, 0.5}) end)
  bindSpecIf(mapping.bottom_half,  function() self:move({0.0, 0.5, 1.0, 0.5}) end)
  bindSpecIf(mapping.top_left,     function() self:move({0.0, 0.0, 0.5, 0.5}) end)
  bindSpecIf(mapping.top_right,    function() self:move({0.5, 0.0, 0.5, 0.5}) end)
  bindSpecIf(mapping.bottom_left,  function() self:move({0.0, 0.5, 0.5, 0.5}) end)
  bindSpecIf(mapping.bottom_right, function() self:move({0.5, 0.5, 0.5, 0.5}) end)
  bindSpecIf(mapping.maximize,     function() self:move({0.0, 0.0, 1.0, 1.0}) end)
  bindSpecIf(mapping.almost_max,   function() self:move({0.1, 0.1, 0.8, 0.8}) end)
  bindSpecIf(mapping.smaller,      function() self:resize(-100) end)
  bindSpecIf(mapping.larger,       function() self:resize(100) end)
  bindSpecIf(mapping.center,       function() self:center() end)
  return self
end

return obj
