local gfx <const> = playdate.graphics
---@class ClockApp: _Sprite
---@overload fun(): ClockApp
ClockApp = class("ClockApp").extends(gfx.sprite) or ClockApp


function ClockApp:init()
    self.time = playdate.getTime()
    self:add()
end

function ClockApp:update()
    self.time = playdate.getTime()
    print(self.time.second)
end