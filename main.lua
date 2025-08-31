function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Layered Background Display")
    
    -- Load the three background images
    backgroundLast = love.graphics.newImage("Future Components/background_last.png")
    backgroundMiddle = love.graphics.newImage("Future Components/background_middle.png")
    backgroundTop = love.graphics.newImage("Future Components/background_top.png")
    
    -- Load all sprites
    spriteMasks = love.graphics.newImage("Future Components/sprite_masks.png")
    spriteWand = love.graphics.newImage("Future Components/sprite_wand.png")
    spriteSpade = love.graphics.newImage("Future Components/sprite_spade.png")
    spritePrayer = love.graphics.newImage("Future Components/sprite_prayer.png")
    spriteJewl2 = love.graphics.newImage("Future Components/sprite_jewl2.png")
    spriteCupMan = love.graphics.newImage("Future Components/sprite_cup_man.png")
    
    -- Target dimensions for compressed backgrounds
    targetWidth = 640
    targetHeight = 360
    
    -- Calculate scale factors for each image
    scaleXLast = targetWidth / backgroundLast:getWidth()
    scaleYLast = targetHeight / backgroundLast:getHeight()
    
    scaleXMiddle = targetWidth / backgroundMiddle:getWidth()
    scaleYMiddle = targetHeight / backgroundMiddle:getHeight()
    
    scaleXTop = targetWidth / backgroundTop:getWidth()
    scaleYTop = targetHeight / backgroundTop:getHeight()
    
    -- Sprite floating animation variables
    spriteTime = 0
    
    -- Base positions for each sprite (spread across the screen)
    spriteMasksBaseX = 960 - spriteMasks:getWidth() / 2  -- Center
    spriteMasksBaseY = 200 - spriteMasks:getHeight() / 2 - 40
    
    spriteWandBaseX = 300 - spriteWand:getWidth() / 2  -- Left side
    spriteWandBaseY = 300 - spriteWand:getHeight() / 2
    
    spriteSpadeBaseX = 1320 - spriteSpade:getWidth() / 2  -- Right side
    spriteSpadeBaseY = 350 - spriteSpade:getHeight() / 2
    
    spritePrayerBaseX = 390 - spritePrayer:getWidth() / 2  -- Center-left
    spritePrayerBaseY = 880 - spritePrayer:getHeight() / 2
    
    spriteJewl2BaseX = 1520 - spriteJewl2:getWidth() / 2  -- Center-right
    spriteJewl2BaseY = 650 - spriteJewl2:getHeight() / 2
    
    spriteCupManBaseX = 960 - spriteCupMan:getWidth() / 2  -- Center bottom
    spriteCupManBaseY = 900 - spriteCupMan:getHeight() / 2
end

function love.update(dt)
    -- Update time for floating animation
    spriteTime = spriteTime + dt
end

function love.draw()
    -- Clear the screen
    love.graphics.clear(0, 0, 0)
    
    -- Draw the layers with significant horizontal offsets and scaling to 640x360
    -- All on same Y axis (400px from top) but spread horizontally
    love.graphics.draw(backgroundLast, 100, 420, 0, scaleXLast, scaleYLast)      -- Far left
    love.graphics.draw(backgroundMiddle, 640, 440, 0, scaleXMiddle, scaleYMiddle) -- Center
    love.graphics.draw(backgroundTop, 1180, 480, 0, scaleXTop, scaleYTop)         -- Far right
    
    -- Calculate floating positions for all sprites using sin functions
    local floatOffsetX = math.sin(spriteTime * 0.8) * 30  -- Horizontal floating
    local floatOffsetY = math.sin(spriteTime * 1.5) * 20  -- Vertical floating

    -- Vary the float distance for each sprite
    local sinOffsetWandx = 5
    local sinOffsetWandy = 2

    local sinOffsetSpadex = 3
    local sinOffsetSpadey = 5.7

    local sinOffsetJewl2x = 5.2
    local sinOffsetJewl2y = 9

    local sinOffsetCupManx = 8.4
    local sinOffsetCupMany = 1.1

    local sinOffsetPrayerx = 1.6
    local sinOffsetPrayery = 4.2
    
    -- Draw all floating sprites
    love.graphics.draw(spriteMasks, spriteMasksBaseX + floatOffsetX, spriteMasksBaseY + floatOffsetY)
    love.graphics.draw(spriteWand, spriteWandBaseX + floatOffsetX * sinOffsetWandx, spriteWandBaseY + floatOffsetY * sinOffsetWandy)
    love.graphics.draw(spriteSpade, spriteSpadeBaseX + floatOffsetX * sinOffsetSpadex, spriteSpadeBaseY + floatOffsetY * sinOffsetSpadey)
    love.graphics.draw(spritePrayer, spritePrayerBaseX + floatOffsetX * sinOffsetPrayerx, spritePrayerBaseY + floatOffsetY * sinOffsetPrayery)
    love.graphics.draw(spriteJewl2, spriteJewl2BaseX + floatOffsetX * sinOffsetJewl2x, spriteJewl2BaseY + floatOffsetY * sinOffsetJewl2y)
    love.graphics.draw(spriteCupMan, spriteCupManBaseX + floatOffsetX * sinOffsetCupManx , spriteCupManBaseY + floatOffsetY * sinOffsetCupMany)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end