local composer = require( "composer" )
 
local splash = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function splash:create( event )
 
    local scene1Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function splash:show( event )
 
    local scene1Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        background = display.newImageRect( "./assets/background-splash.png", 720, 560 )
        background.x = display.contentCenterX
        background.y = 242
        background.id = "the character"
        scene1Group:insert(background)

        local text = display.newText( "QuickType" , 160, 70, "Impact", 60 )
        text:setFillColor(  200/255, 100/255, 0/255 )
        scene1Group:insert(text)

        local text1 = display.newText( "Interactive Type Learner" , 160, 160, native.systemFont, 27 )
        text1:setFillColor( 100/255, 250/255, 200/255 )

        scene1Group:insert(text1)
        
        
        local loadingOptions =
        {
            width = 144,
            height = 144,
            numFrames = 48
        }
        local sheetIdleKnight = graphics.newImageSheet( "./assets/spritesheets/loading.png",  loadingOptions )
        -- sequences table
        local sequence_data = {
            -- consecutive frames sequence
            {
                name = "idle",
                start = 1,
                count = 49,
                time = 3000,
                loopCount = 0,
                sheet = sheetIdleKnight
            },
        }
        
        
        
        local loading = display.newSprite( sheetIdleKnight, sequence_data )
        loading.x = 160
        loading.y = 350
        loading.xScale = 144/144
        loading.yScale = 144/144
        loading:play()

    elseif ( phase == "did" ) then
        --timer.performWithDelay(3000, function()
            --background:removeSelf()
            --composer.gotoScene( "mainmenu" )
        --end
        --)


    end
end
 
 
-- hide()
function splash:hide( event )
 
    local scene1Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function splash:destroy( event )
 
    local scene1Group = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
splash:addEventListener( "create", splash )
splash:addEventListener( "show", splash )
splash:addEventListener( "hide", splash )
splash:addEventListener( "destroy", splash )
-- -----------------------------------------------------------------------------------
 
return splash