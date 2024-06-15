local pd <const> = playdate
local gfx <const> = playdate.graphics

SCENES = {
    Clock = 0,
}

CURRENT_SCENE = SCENES.Clock

ISLOADING = false

class('SceneManager').extends()

function SceneManager:switchScene(scene, ...)
    if not ISLOADING then
        -- Order matters !
        self.newScene = scene
        self.sceneArgs = ...
        ISLOADING = true
        self:loadNewScene()
    end
end

function SceneManager:loadNewScene()
    self:cleanupScene(function ()
        self.newScene(self.sceneArgs)
    end)
end

function SceneManager:cleanupScene(callback)
    INTERACTIBLE_OBJECTS = {}
    INPUT_OVERRIDE_UI = false
    gfx.sprite.removeAll()
    self:removeAllTimers()
    gfx.setDrawOffset(0, 0)
    callback()
end

function SceneManager:removeAllTimers()
    local allTimers = pd.timer.allTimers()
    for _, timer in ipairs(allTimers) do
        timer:remove()
    end
end