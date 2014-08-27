-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local physics = require("physics")
display.setStatusBar( display.HiddenStatusBar )
W, H = display.contentWidth, display.contentHeight


-- ASSETS TO SET THE SCENE
----------------------------------------------
	local bg = display.newRect( W/2, H/2, W, H )
		bg:setFillColor( 1,1,1 )

	local text = display.newImageRect( "IMAGES/WW_text.png", 1992, 909 )
		text.x = W/2
		text.y = H/3
	local ui = display.newImageRect( "IMAGES/WW_UI.png", 2078, 958 )
		ui.x = W/2 + 5
		ui.y = H-470
	local knight = display.newImageRect( "IMAGES/WW_Knight.png", 249, 506 )
		knight.x = W*.91
		knight.y = H-670


--WORD SPOTS/BOXES
---------------------------------------------
	local adj_1 = display.newImage( "IMAGES/WW_AdjBox.png", W*0.72, H*0.09 )
		adj_1.isVisible = false
		adj_1.isHitTestable = true
	local verb_1 = display.newImage( "IMAGES/WW_VerbBox.png", W*0.82, H*0.17 )
		verb_1.isVisible = false
		verb_1.isHitTestable = true
	local noun_1 = display.newImage( "IMAGES/WW_NounBox.png", W*0.285, H*0.24 )
		noun_1.isVisible = false
		noun_1.isHitTestable = true
	local noun_2 = display.newImage( "IMAGES/WW_NounBox.png", W*0.425, H*0.32 )
		noun_2.isVisible = false
		noun_2.isHitTestable = true
	local noun_22 = display.newImage( "IMAGES/WW_NounBox.png", W*0.18, H*0.39 )
		noun_22.isVisible = false
		noun_22.isHitTestable = true
	local verb_2 = display.newImage( "IMAGES/WW_VerbBox.png", W*0.24, H*0.52 )
		verb_2.isVisible = false
		verb_2.isHitTestable = true
	local noun_3 = display.newImage( "IMAGES/WW_NounBox.png", W*0.11, H*0.6 )
		noun_3.isVisible = false
		noun_3.isHitTestable = true

--WORDS & WORD PROPERTIES
----------------------------------------------
	local WIELD_SHEET = graphics.newImageSheet( "WORDS/WIELD_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 220, height = 110},
	{x = 220, y = 0, width = 220, height = 110},
	{x = 440, y = 0, width = 337, height = 110}}
		} )
	local WIELD_SPRITE = display.newSprite( WIELD_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1, loopCount = 0},
		{name = "special", start = 3, count = 1}
		} )
		WIELD_SPRITE.anchorX = -1
		WIELD_SPRITE.x = 110
		WIELD_SPRITE.y = 1225
		WIELD_SPRITE:setSequence( "default" )
		WIELD_SPRITE:play( )

	local TOYS_SHEET = graphics.newImageSheet( "WORDS/TOYS_SPRITE.png",{ width = 166, height = 109, numFrames = 2})
	local TOYS_SPRITE = display.newSprite( TOYS_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		TOYS_SPRITE.anchorX = -1
		TOYS_SPRITE.x = 110
		TOYS_SPRITE.y = 1325
		TOYS_SPRITE:setSequence( "default" )
		TOYS_SPRITE:play( )

	local SWORD_SHEET = graphics.newImageSheet( "WORDS/SWORD_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 252, height = 110},
	{x = 252, y = 0, width = 252, height = 110},
	{x = 504, y = 0, width = 288, height = 110}}
		} )
	local SWORD_SPRITE = display.newSprite( SWORD_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1},
		{name = "special", start = 3, count = 1}
		} )
		SWORD_SPRITE.anchorX = -1
		SWORD_SPRITE.x = 110
		SWORD_SPRITE.y = 1425
		SWORD_SPRITE:setSequence( "default" )
		SWORD_SPRITE:play( )

	local STINKY_SHEET = graphics.newImageSheet( "WORDS/STINKY_SPRITE.png",{width = 244, height = 109, numFrames = 2
		} )
	local STINKY_SPRITE = display.newSprite( STINKY_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}})
		STINKY_SPRITE.anchorX = -1
		STINKY_SPRITE.x = 450
		STINKY_SPRITE.y = 1225
		STINKY_SPRITE:setSequence( "default" )
		STINKY_SPRITE:play( )

	local POKE_SHEET = graphics.newImageSheet( "WORDS/POKE_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 180, height = 110},
	{x = 180, y = 0, width = 180, height = 110},
	{x = 360, y = 0, width = 264, height = 110}}
		} )
	local POKE_SPRITE = display.newSprite( POKE_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1},
		{name = "special", start = 3, count = 1}
		} )
		POKE_SPRITE.anchorX = -1
		POKE_SPRITE.x = 450
		POKE_SPRITE.y = 1325
		POKE_SPRITE:setSequence( "default" )
		POKE_SPRITE:play( )

	local SHOWER_SHEET = graphics.newImageSheet( "WORDS/SHOWER_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 294, height = 110},
	{x = 294, y = 0, width = 294, height = 110},
	{x = 588, y = 0, width = 413, height = 110}}
		} )
	local SHOWER_SPRITE = display.newSprite( SHOWER_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1},
		{name = "special", start = 3, count = 1}
		} )
		SHOWER_SPRITE.anchorX = -1
		SHOWER_SPRITE.x = 450
		SHOWER_SPRITE.y = 1425
		SHOWER_SPRITE:setSequence( "default" )
		SHOWER_SPRITE:play( )

	local PEOPLE_SHEET = graphics.newImageSheet( "WORDS/PEOPLE_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 258, height = 109},
	{x = 258, y = 0, width = 258, height = 109}}
		} )
	local PEOPLE_SPRITE = display.newSprite( PEOPLE_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		PEOPLE_SPRITE.anchorX = -1
		PEOPLE_SPRITE.x = 790
		PEOPLE_SPRITE.y = 1225
		PEOPLE_SPRITE:setSequence( "default" )
		PEOPLE_SPRITE:play( )

	local LOVEABLE_SHEET = graphics.newImageSheet( "WORDS/LOVEABLE_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 341, height = 110},
	{x = 341, y = 0, width = 341, height = 110}}
		} )
	local LOVEABLE_SPRITE = display.newSprite( LOVEABLE_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		LOVEABLE_SPRITE.anchorX = -1
		LOVEABLE_SPRITE.x = 790
		LOVEABLE_SPRITE.y = 1325
		LOVEABLE_SPRITE:setSequence( "default" )
		LOVEABLE_SPRITE:play( )

	local JOYFUL_SHEET = graphics.newImageSheet( "WORDS/JOYFUL_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 247, height = 110},
	{x = 247, y = 0, width = 247, height = 110}}
		} )
	local JOYFUL_SPRITE = display.newSprite( JOYFUL_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		JOYFUL_SPRITE.anchorX = -1
		JOYFUL_SPRITE.x = 790
		JOYFUL_SPRITE.y = 1425
		JOYFUL_SPRITE:setSequence( "default" )
		JOYFUL_SPRITE:play( )

	local FLOWERS_SHEET = graphics.newImageSheet( "WORDS/FLOWERS_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 318, height = 110},
	{x = 318, y = 0, width = 318, height = 110}}
		} )
	local FLOWERS_SPRITE = display.newSprite( FLOWERS_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		FLOWERS_SPRITE.anchorX = -1
		FLOWERS_SPRITE.x = 1190
		FLOWERS_SPRITE.y = 1225
		FLOWERS_SPRITE:setSequence( "default" )
		FLOWERS_SPRITE:play( )

	local FISH_SHEET = graphics.newImageSheet( "WORDS/FISH_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 156, height = 110},
	{x = 156, y = 0, width = 156, height = 110}}
		} )
	local FISH_SPRITE = display.newSprite( FISH_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		FISH_SPRITE.anchorX = -1
		FISH_SPRITE.x = 1190
		FISH_SPRITE.y = 1325
		FISH_SPRITE:setSequence( "default" )
		FISH_SPRITE:play( )

	local FAMOUS_SHEET = graphics.newImageSheet( "WORDS/FAMOUS_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 283, height = 110},
	{x = 283, y = 0, width = 283, height = 110}}
		} )
	local FAMOUS_SPRITE = display.newSprite( FAMOUS_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		FAMOUS_SPRITE.anchorX = -1
		FAMOUS_SPRITE.x = 1190
		FAMOUS_SPRITE.y = 1425
		FAMOUS_SPRITE:setSequence( "default" )
		FAMOUS_SPRITE:play( )

	local CLEAN_SHEET = graphics.newImageSheet( "WORDS/CLEAN_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 215, height = 110},
	{x = 215, y = 0, width = 215, height = 110},
	{x = 430, y = 0, width = 339, height = 110}}
		} )
	local CLEAN_SPRITE = display.newSprite( CLEAN_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1},
		{name = "special", start = 3, count = 1}
		} )
		CLEAN_SPRITE.anchorX = -1
		CLEAN_SPRITE.x = 1570
		CLEAN_SPRITE.y = 1225
		CLEAN_SPRITE:setSequence( "default" )
		CLEAN_SPRITE:play( )

	local BROOM_SHEET = graphics.newImageSheet( "WORDS/BROOM_SPRITE.png",{frames = {
	{x = 0, y = 0, width = 256, height = 110},
	{x = 256, y = 0, width = 256, height = 110},
	{x = 512, y = 0, width = 296, height = 110}}
		} )
	local BROOM_SPRITE = display.newSprite( BROOM_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1},
		{name = "special", start = 3, count = 1}
		} )
		BROOM_SPRITE.anchorX = -1
		BROOM_SPRITE.x = 1570
		BROOM_SPRITE.y = 1325
		BROOM_SPRITE:setSequence( "default" )
		BROOM_SPRITE:play( )
--IMAGES
----------------------------------------------
	local Fish = display.newImage( "IMAGES/WW_Fish.png", W*0.85, H*0.61 )
		Fish.isVisible = false
	local Loveable = display.newImage( "IMAGES/WW_Loveable.png", W*0.87, H*0.52 )
		Loveable.isVisible = false
	local Stinky = display.newImage( "IMAGES/WW_Stinky.png", W*0.9, H*0.5 )
		Stinky.isVisible = false
	local Famous = display.newImage( "IMAGES/WW_Famous.png", W*0.85, H*0.55 )
		Famous.isVisible = false
	local Toys = display.newImage( "IMAGES/WW_Toys.png", W*0.843, H*0.643 )
		Toys.isVisible = false
	local People = display.newImage( "IMAGES/WW_People.png", W*0.814, H*0.57 )
		People.isVisible = false
	local Flowers = display.newImage( "IMAGES/WW_Flowers.png", W*0.835, H*0.59 )
		Flowers.isVisible = false
	local Broom = display.newImage( "IMAGES/WW_Broom.png", W*0.833, H*0.61 )
		Broom.isVisible = false
	local Sword = display.newImage( "IMAGES/WW_Sword.png", W*0.84, H*0.6 )
		Sword.isVisible = true


--DIALOG BOXES
----------------------------------------------
	local wield_box = display.newImage( "TEXTBOX/wield_box.png", W*0.78, H*0.38 )
		wield_box.isVisible = false
	local swords2_box = display.newImage( "TEXTBOX/swords2_box.png", W*0.78, H*0.38 )
		swords2_box.isVisible = false
	local toys2_box = display.newImage( "TEXTBOX/toys2_box.png", W*0.78, H*0.38 )
		toys2_box.isVisible = false
	local brooms2_box = display.newImage( "TEXTBOX/brooms2_box.png", W*0.78, H*0.38 )
		brooms2_box.isVisible = false
	local fishes_box = display.newImage( "TEXTBOX/fishes_box.png", W*0.78, H*0.38 )
		fishes_box.isVisible = false
	local flowers2_box = display.newImage( "TEXTBOX/flowers2_box.png", W*0.78, H*0.38 )
		flowers2_box.isVisible = false
	local shower_box = display.newImage( "TEXTBOX/shower_box.png", W*0.78, H*0.38 )
		shower_box.isVisible = false
	local clean_box = display.newImage( "TEXTBOX/clean_box.png", W*0.78, H*0.38 )
		clean_box.isVisible = false
	local poke_box = display.newImage( "TEXTBOX/poke_box.png", W*0.78, H*0.38 )
		poke_box.isVisible = false
	local flowers_box = display.newImage( "TEXTBOX/flowers_box.png", W*0.78, H*0.38 )
		flowers_box.isVisible = false
	local brooms_box = display.newImage( "TEXTBOX/brooms_box.png", W*0.78, H*0.38 )
		brooms_box.isVisible = false
	local swords_box = display.newImage( "TEXTBOX/swords_box.png", W*0.78, H*0.38 )
		swords_box.isVisible = false
	local fish_box2 = display.newImage( "TEXTBOX/fish_box2.png", W*0.78, H*0.38 )
		fish_box2.isVisible = false
	local toys_box = display.newImage( "TEXTBOX/toys_box.png", W*0.78, H*0.38 )
		toys_box.isVisible = false
	local people_box = display.newImage( "TEXTBOX/people_box.png", W*0.78, H*0.38 )
		people_box.isVisible = false
	local broom_box = display.newImage( "TEXTBOX/broom_box.png", W*0.78, H*0.38 )
		broom_box.isVisible = false
	local fish_box = display.newImage( "TEXTBOX/fish_box.png", W*0.78, H*0.38 )
		fish_box.isVisible = false
	local poking_box = display.newImage( "TEXTBOX/poking_box.png", W*0.78, H*0.38 )
		poking_box.isVisible = false
	local cleaning_box = display.newImage( "TEXTBOX/cleaning_box.png", W*0.78, H*0.38 )
		cleaning_box.isVisible = false
	local showering_box = display.newImage( "TEXTBOX/showering_box.png", W*0.78, H*0.38 )
		showering_box.isVisible = false
	local wielding_box = display.newImage( "TEXTBOX/wielding_box.png", W*0.78, H*0.38 )
		wielding_box.isVisible = false
	local joyful_box = display.newImage( "TEXTBOX/joyful_box.png", W*0.78, H*0.38 )
		joyful_box.isVisible = false


-- GAMEPLAY FUNCTIONS
----------------------------------------------

	--display word boxes when player taps empty spaces
	local function reveal( event )
			if (event.target==noun_2) or (event.target==noun_22) then
				  adj_1.isVisible = false
				 verb_1.isVisible = false
				 noun_1.isVisible = false
				 noun_2.isVisible = true
				noun_22.isVisible = true
				 verb_2.isVisible = false
				 noun_3.isVisible = false
			else
				  adj_1.isVisible = false
				 verb_1.isVisible = false
				 noun_1.isVisible = false
				 noun_2.isVisible = false
				noun_22.isVisible = false
				 verb_2.isVisible = false
				 noun_3.isVisible = false
				 event.target.isVisible = true	
			end
	end

	--drag and drop functions
	function WIELD_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function TOYS_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function SWORD_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function STINKY_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function SHOWER_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function POKE_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function PEOPLE_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end


	function LOVEABLE_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end


	function JOYFUL_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function FLOWERS_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function FISH_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function FAMOUS_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function CLEAN_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end

	function BROOM_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			display.getCurrentStage( ):setFocus( self, nil )
			transition.to( self, {time = 100, x = self.startX, y = self.startY} )
		end
	end


--EVENT LISTENERS
----------------------------------------------
	adj_1:addEventListener( "tap", reveal )
	verb_1:addEventListener( "tap", reveal )
	noun_1:addEventListener( "tap", reveal )
	noun_2:addEventListener( "tap", reveal )
	noun_22:addEventListener( "tap", reveal )
	verb_2:addEventListener( "tap", reveal )
	noun_3:addEventListener( "tap", reveal )

	WIELD_SPRITE:addEventListener( "touch", WIELD_SPRITE )
	TOYS_SPRITE:addEventListener( "touch", TOYS_SPRITE )
	SWORD_SPRITE:addEventListener( "touch", SWORD_SPRITE )
	STINKY_SPRITE:addEventListener( "touch", STINKY_SPRITE )
	SHOWER_SPRITE:addEventListener( "touch", SHOWER_SPRITE )
	POKE_SPRITE:addEventListener( "touch", POKE_SPRITE )
	PEOPLE_SPRITE:addEventListener( "touch", PEOPLE_SPRITE )
	LOVEABLE_SPRITE:addEventListener( "touch", LOVEABLE_SPRITE )
	JOYFUL_SPRITE:addEventListener( "touch", JOYFUL_SPRITE )
	FLOWERS_SPRITE:addEventListener( "touch", FLOWERS_SPRITE )
	FISH_SPRITE:addEventListener( "touch", FISH_SPRITE )
	FAMOUS_SPRITE:addEventListener( "touch", FAMOUS_SPRITE )
	CLEAN_SPRITE:addEventListener( "touch", CLEAN_SPRITE )
	BROOM_SPRITE:addEventListener( "touch", BROOM_SPRITE )

