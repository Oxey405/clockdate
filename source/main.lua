import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/math"

local gfx <const> = playdate.graphics


-- Utilities
import "utils/SceneManager"

-- Scenes/subapps
import "scenes/clock"

math.randomseed(playdate.getSecondsSinceEpoch())


SCENE_MANAGER = SceneManager()
ClockApp()

function playdate.update()
  gfx.sprite.update()
  playdate.timer.updateTimers()
end