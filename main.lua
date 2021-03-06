-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local physics = require("physics")
physics.start( )
physics.setGravity( 0, 0 )
display.setStatusBar( display.HiddenStatusBar )
W, H = display.contentWidth, display.contentHeight

--SOUNDS AND MUSIC
-----------------------------------------------
local bg_musics = audio.loadStream( "bg_musics.mp3" )
local enter = audio.loadSound( "enter.mp3" )
local correct_sound = audio.loadSound( "correct.mp3" )
local wrong_sound = audio.loadSound( "wrong.mp3" )


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


--WORD SPOTS/BOXES
---------------------------------------------
	local adj_1 = display.newImage( "IMAGES/WW_AdjBox.png", W*0.72, H*0.09 )
		adj_1.isVisible = false
		adj_1.isHitTestable = true
		physics.addBody( adj_1, "dynamic", {density=0, friction=0, bounce=0 } )
		adj_1.isSensor = true
		adj_1.type = "adjective"
	local verb_1 = display.newImage( "IMAGES/WW_VerbBox.png", W*0.82, H*0.17 )
		verb_1.isVisible = false
		verb_1.isHitTestable = true
		physics.addBody( verb_1, "dynamic", {density=0, friction=0, bounce=0 } )
		verb_1.isSensor = true
		verb_1.type = "verb"
	local noun_1 = display.newImage( "IMAGES/WW_NounBox.png", W*0.285, H*0.24 )
		noun_1.isVisible = false
		noun_1.isHitTestable = true
		physics.addBody( noun_1, "dynamic", {density=0, friction=0, bounce=0 } )
		noun_1.isSensor = true
		noun_1.type = "noun"
	local noun_2 = display.newImage( "IMAGES/WW_NounBox.png", W*0.425, H*0.32 )
		noun_2.isVisible = false
		noun_2.isHitTestable = true
		physics.addBody( noun_2, "dynamic", {density=0, friction=0, bounce=0 } )
		noun_2.isSensor = true
		noun_2.type = "noun"
	local noun_22 = display.newImage( "IMAGES/WW_NounBox.png", W*0.18, H*0.39 )
		noun_22.isVisible = false
		noun_22.isHitTestable = true
		physics.addBody( noun_22, "dynamic", {density=0, friction=0, bounce=0 } )
		noun_22.isSensor = true
		noun_22.type = "noun"
	local verb_2 = display.newImage( "IMAGES/WW_VerbBox.png", W*0.24, H*0.52 )
		verb_2.isVisible = false
		verb_2.isHitTestable = true
		physics.addBody( verb_2, "dynamic", {density=0, friction=0, bounce=0 } )
		verb_2.isSensor = true
		verb_2.type = "verb"
	local noun_3 = display.newImage( "IMAGES/WW_NounBox.png", W*0.11, H*0.6 )
		noun_3.isVisible = false
		noun_3.isHitTestable = true
		physics.addBody( noun_3, "dynamic", {density=0, friction=0, bounce=0 } )
		noun_3.isSensor = true
		noun_3.type = "noun"

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
		WIELD_SPRITE.type = "verb"
		WIELD_SPRITE.id = "wield"
		WIELD_SPRITE.hasCollided1 = false
		WIELD_SPRITE.hasCollided2 = false
		WIELD_SPRITE:setSequence( "default" )
		WIELD_SPRITE:play( )
		physics.addBody( WIELD_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		WIELD_SPRITE.isSensor = true

	local TOYS_SHEET = graphics.newImageSheet( "WORDS/TOYS_SPRITE.png",{ width = 166, height = 109, numFrames = 2})
	local TOYS_SPRITE = display.newSprite( TOYS_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}
		} )
		TOYS_SPRITE.anchorX = -1
		TOYS_SPRITE.x = 110
		TOYS_SPRITE.y = 1325
		TOYS_SPRITE.type = "noun"
		TOYS_SPRITE.id = "toys"
		TOYS_SPRITE:setSequence( "default" )
		TOYS_SPRITE:play( )
		physics.addBody( TOYS_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		TOYS_SPRITE.isSensor = true

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
		SWORD_SPRITE.type = "noun"
		SWORD_SPRITE.id = "sword"
		SWORD_SPRITE:setSequence( "default" )
		SWORD_SPRITE:play( )
		physics.addBody( SWORD_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		SWORD_SPRITE.isSensor = true

	local STINKY_SHEET = graphics.newImageSheet( "WORDS/STINKY_SPRITE.png",{width = 244, height = 109, numFrames = 2
		} )
	local STINKY_SPRITE = display.newSprite( STINKY_SHEET, {
		{name = "default", start = 1, count = 1},
		{name = "color", start = 2, count = 1}})
		STINKY_SPRITE.anchorX = -1
		STINKY_SPRITE.x = 450
		STINKY_SPRITE.y = 1225
		STINKY_SPRITE.type = "adjective"
		STINKY_SPRITE.id = "stinky"
		STINKY_SPRITE:setSequence( "default" )
		STINKY_SPRITE:play( )
		physics.addBody( STINKY_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		STINKY_SPRITE.isSensor = true

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
		POKE_SPRITE.hasCollided1 = false
		POKE_SPRITE.hasCollided2 = false
		POKE_SPRITE.type = "verb"
		POKE_SPRITE.id = "poke"
		POKE_SPRITE:setSequence( "default" )
		POKE_SPRITE:play( )
		physics.addBody( POKE_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		POKE_SPRITE.isSensor = true

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
		SHOWER_SPRITE.type = "verb"
		SHOWER_SPRITE.id = "shower"
		SHOWER_SPRITE.hasCollided1 = false
		SHOWER_SPRITE.hasCollided2 = false
		SHOWER_SPRITE:setSequence( "default" )
		SHOWER_SPRITE:play( )
		physics.addBody( SHOWER_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		SHOWER_SPRITE.isSensor = true

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
		PEOPLE_SPRITE.type = "noun"
		PEOPLE_SPRITE.id = "people"
		PEOPLE_SPRITE:setSequence( "default" )
		PEOPLE_SPRITE:play( )
		physics.addBody( PEOPLE_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		PEOPLE_SPRITE.isSensor = true

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
		LOVEABLE_SPRITE.type = "adjective"
		LOVEABLE_SPRITE.id = "loveable"
		LOVEABLE_SPRITE:setSequence( "default" )
		LOVEABLE_SPRITE:play( )
		physics.addBody( LOVEABLE_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		LOVEABLE_SPRITE.isSensor = true

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
		JOYFUL_SPRITE.type = "adjective"
		JOYFUL_SPRITE.id = "joyful"
		JOYFUL_SPRITE:setSequence( "default" )
		JOYFUL_SPRITE:play( )
		physics.addBody( JOYFUL_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		JOYFUL_SPRITE.isSensor = true

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
		FLOWERS_SPRITE.type = "noun"
		FLOWERS_SPRITE.id = "flowers"
		FLOWERS_SPRITE:setSequence( "default" )
		FLOWERS_SPRITE:play( )
		physics.addBody( FLOWERS_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		FLOWERS_SPRITE.isSensor = true

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
		FISH_SPRITE.type = "noun"
		FISH_SPRITE.id = "fish"
		FISH_SPRITE:setSequence( "default" )
		FISH_SPRITE:play( )
		physics.addBody( FISH_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		FISH_SPRITE.isSensor = true

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
		FAMOUS_SPRITE.type = "adjective"
		FAMOUS_SPRITE.id = "famous"
		FAMOUS_SPRITE:setSequence( "default" )
		FAMOUS_SPRITE:play( )
		physics.addBody( FAMOUS_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		FAMOUS_SPRITE.isSensor = true

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
		CLEAN_SPRITE.type = "verb"
		CLEAN_SPRITE.id = "clean"
		CLEAN_SPRITE.hasCollided1 = false
		CLEAN_SPRITE.hasCollided2 = false
		CLEAN_SPRITE:setSequence( "default" )
		CLEAN_SPRITE:play( )
		physics.addBody( CLEAN_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		CLEAN_SPRITE.isSensor = true

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
		BROOM_SPRITE.type = "noun"
		BROOM_SPRITE.id = "broom"
		BROOM_SPRITE:setSequence( "default" )
		BROOM_SPRITE:play( )
		physics.addBody( BROOM_SPRITE, "dynamic", {density=0, friction=0, bounce=0 } )
		BROOM_SPRITE.isSensor = true

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
		Sword.isVisible = false


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
				 audio.play( enter )
			else
				  adj_1.isVisible = false
				 verb_1.isVisible = false
				 noun_1.isVisible = false
				 noun_2.isVisible = false
				noun_22.isVisible = false
				 verb_2.isVisible = false
				 noun_3.isVisible = false
				 event.target.isVisible = true	
				 audio.play( enter )
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.74
				self.y = H*0.17
				self:setSequence( "special" )
				self:play( )
				wielding_box.isVisible = true
				timer.performWithDelay( 5000, function () wielding_box.isVisible = false end )
				showering_box.isVisible = false
				cleaning_box.isVisible = false
				poking_box.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.16
				self.y = H*0.525
				shower_box.isVisible = false
				clean_box.isVisible = false
				poke_box.isVisible = false
				wield_box.isVisible = true
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () wield_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				wielding_box.isVisible = false
				wield_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 110, y = 1225} )
			end	
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.22
				self.y = H*0.24
				Broom.isVisible = false
				People.isVisible = false
				Fish.isVisible = false
				Flowers.isVisible = false
				Sword.isVisible = false
				Toys.isVisible = true
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.35
				self.y = H*0.32
				toys_box.isVisible = true
					TOYS_SPRITE2 = display.newSprite( TOYS_SHEET, {
						{name = "default", start = 1, count = 1},
						{name = "color", start = 2, count = 1}
						} )
						TOYS_SPRITE2.anchorX = -1
						TOYS_SPRITE2.x = W*0.1
						TOYS_SPRITE2.y = H*0.39
						TOYS_SPRITE2:setSequence( "default" )
						TOYS_SPRITE2:play( )
				flowers_box.isVisible = false
				people_box.isVisible = false
				brooms_box.isVisible = false
				fish_box.isVisible = false
				swords_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () toys_box.isVisible = false end )
			elseif (self.hasCollided3 == true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.03
				self.y = H*0.6
				brooms2_box.isVisible = false
				fishes_box.isVisible = false
				flowers2_box.isVisible = false
				swords2_box.isVisible = false
				toys2_box.isVisible = true
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () toys2_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				Toys.isVisible = false
				toys_box.isVisible = false
				toys2_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 110, y = 1325} )
				if (TOYS_SPRITE2) then
					TOYS_SPRITE2:removeSelf( )
					TOYS_SPRITE2 = nil
				end
			end
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.22
				self.y = H*0.24
				Broom.isVisible = false
				People.isVisible = false
				Fish.isVisible = false
				Flowers.isVisible = false
				Sword.isVisible = true
				Toys.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.35
				self.y = H*0.32
				toys_box.isVisible = false
					SWORD_SPRITE2 = display.newSprite( SWORD_SHEET, {
					{name = "default", start = 1, count = 1},
					{name = "color", start = 2, count = 1},
					{name = "special", start = 3, count = 1}
					} )
						SWORD_SPRITE2.anchorX = -1
						SWORD_SPRITE2.x = W*0.1
						SWORD_SPRITE2.y = H*0.39
						SWORD_SPRITE2:setSequence( "special" )
						SWORD_SPRITE2:play( )
				flowers_box.isVisible = false
				people_box.isVisible = false
				brooms_box.isVisible = false
				fish_box.isVisible = false
				swords_box.isVisible = true
				SWORD_SPRITE:setSequence( "special" )
				SWORD_SPRITE:play( )
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () swords_box.isVisible = false end )
			elseif (self.hasCollided3 == true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.03
				self.y = H*0.6
				self:setSequence( "special" )
				self:play( )
				brooms2_box.isVisible = false
				fishes_box.isVisible = false
				flowers2_box.isVisible = false
				swords2_box.isVisible = true
				toys2_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () swords2_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				Sword.isVisible = false
				swords_box.isVisible = false
				swords2_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 110, y = 1425} )
				if (SWORD_SPRITE2) then
					SWORD_SPRITE2:removeSelf( )
					SWORD_SPRITE2 = nil
				end
			end
		end
	end

	function STINKY_SPRITE:touch (event)
		if (event.phase == "began") then
			self.hasCollided = false
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
			if (self.hasCollided==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.64
				self.y = H*0.09
				Famous.isVisible = false
				Loveable.isVisible = false
				joyful_box.isVisible = false
				Stinky.isVisible = true
				audio.play( correct_sound )
			elseif (self.hasCollided==false)then
				display.getCurrentStage( ):setFocus( self, nil )
				Stinky.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 450, y = 1225} )
			end	
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.74
				self.y = H*0.17
				self:setSequence( "special" )
				self:play( )
				wielding_box.isVisible = false
				timer.performWithDelay( 5000, function () showering_box.isVisible = false end )
				showering_box.isVisible = true
				cleaning_box.isVisible = false
				poking_box.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.16
				self.y = H*0.525
				shower_box.isVisible = true
				clean_box.isVisible = false
				poke_box.isVisible = false
				wield_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () shower_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				showering_box.isVisible = false
				shower_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 450, y = 1425} )
			end
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.74
				self.y = H*0.17
				self:setSequence( "special" )
				self:play( )
				wielding_box.isVisible = false
				timer.performWithDelay( 5000, function () poking_box.isVisible = false end )
				showering_box.isVisible = false
				cleaning_box.isVisible = false
				poking_box.isVisible = true
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.16
				self.y = H*0.525
				shower_box.isVisible = false
				clean_box.isVisible = false
				poke_box.isVisible = true
				wield_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () poke_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				poking_box.isVisible = false
				poke_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 450, y = 1325} )
			end
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.22
				self.y = H*0.24
				Broom.isVisible = false
				People.isVisible = true
				Fish.isVisible = false
				Flowers.isVisible = false
				Sword.isVisible = false
				Toys.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.35
				self.y = H*0.32
				toys_box.isVisible = false
					PEOPLE_SPRITE2 = display.newSprite( PEOPLE_SHEET, {
						{name = "default", start = 1, count = 1},
						{name = "color", start = 2, count = 1}
						} )
						PEOPLE_SPRITE2.anchorX = -1
						PEOPLE_SPRITE2.x = W*0.1
						PEOPLE_SPRITE2.y = H*0.39
						PEOPLE_SPRITE2:setSequence( "default" )
						PEOPLE_SPRITE2:play( )
				flowers_box.isVisible = false
				people_box.isVisible = true
				brooms_box.isVisible = false
				fish_box.isVisible = false
				swords_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () people_box.isVisible = false end )
			elseif (self.hasCollided3 == true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.03
				self.y = H*0.6
				brooms2_box.isVisible = false
				fishes_box.isVisible = false
				flowers2_box.isVisible = false
				swords2_box.isVisible = true
				toys2_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () swords2_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				People.isVisible = false
				people_box.isVisible = false
				swords2_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 790, y = 1225} )
				if (PEOPLE_SPRITE2) then
					PEOPLE_SPRITE2:removeSelf( )
					PEOPLE_SPRITE2 = nil
				end
			end
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
			if (self.hasCollided==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.64
				self.y = H*0.09
				Famous.isVisible = false
				Loveable.isVisible = true
				joyful_box.isVisible = false
				Stinky.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided==false)then
				display.getCurrentStage( ):setFocus( self, nil )
				Loveable.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 790, y = 1325} )
			end	
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
			if (self.hasCollided==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.64
				self.y = H*0.09
				Famous.isVisible = false
				Loveable.isVisible = false
				joyful_box.isVisible = true
				Stinky.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided==false)then
				display.getCurrentStage( ):setFocus( self, nil )
				joyful_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 790, y = 1425} )
			end	
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.22
				self.y = H*0.24
				Broom.isVisible = false
				People.isVisible = false
				Fish.isVisible = false
				Flowers.isVisible = true
				Sword.isVisible = false
				Toys.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.35
				self.y = H*0.32
				toys_box.isVisible = false
					FLOWERS_SPRITE2 = display.newSprite( FLOWERS_SHEET, {
						{name = "default", start = 1, count = 1},
						{name = "color", start = 2, count = 1}
						} )
						FLOWERS_SPRITE2.anchorX = -1
						FLOWERS_SPRITE2.x = W*0.1
						FLOWERS_SPRITE2.y = H*0.39
						FLOWERS_SPRITE2:setSequence( "default" )
						FLOWERS_SPRITE2:play( )
				flowers_box.isVisible = true
				people_box.isVisible = false
				brooms_box.isVisible = false
				fish_box.isVisible = false
				swords_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () flowers_box.isVisible = false end )
			elseif (self.hasCollided3 == true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.03
				self.y = H*0.6
				brooms2_box.isVisible = false
				fishes_box.isVisible = false
				flowers2_box.isVisible = true
				swords2_box.isVisible = false
				toys2_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () flowers2_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				Flowers.isVisible = false
				flowers_box.isVisible = false
				flowers2_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 1190, y = 1225} )
				if (FLOWERS_SPRITE2) then
					FLOWERS_SPRITE2:removeSelf( )
					FLOWERS_SPRITE2 = nil
				end
			end
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.22
				self.y = H*0.24
				Broom.isVisible = false
				People.isVisible = false
				Fish.isVisible = true
				Flowers.isVisible = false
				Sword.isVisible = false
				Toys.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.35
				self.y = H*0.32
				toys_box.isVisible = false
					FISH_SPRITE2 = display.newSprite( FISH_SHEET, {
						{name = "default", start = 1, count = 1},
						{name = "color", start = 2, count = 1}
						} )
						FISH_SPRITE2.anchorX = -1
						FISH_SPRITE2.x = W*0.1
						FISH_SPRITE2.y = H*0.39
						FISH_SPRITE2:setSequence( "default" )
						FISH_SPRITE2:play( )
				flowers_box.isVisible = false
				people_box.isVisible = false
				brooms_box.isVisible = false
				fish_box.isVisible = true
				swords_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () fish_box.isVisible = false end )
			elseif (self.hasCollided3 == true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.03
				self.y = H*0.6
				brooms2_box.isVisible = false
				fishes_box.isVisible = true
				flowers2_box.isVisible = false
				swords2_box.isVisible = false
				toys2_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () fishes_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				Fish.isVisible = false
				fish_box.isVisible = false
				fishes_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 1190, y = 1325} )
				if (FISH_SPRITE2) then
					FISH_SPRITE2:removeSelf( )
					FISH_SPRITE2 = nil
				end
			end
		end
	end

	function FAMOUS_SPRITE:touch (event)
		if (event.phase == "began") then
			self:setSequence( "color" )
			self:play()	
			display.getCurrentStage( ):setFocus( self , event.id )
			self.startX = self.x 
			self.startY = self.y
			self.hasCollided = false
		elseif (event.phase == "moved") then
			self.x = event.x - event.xStart + self.startX
			self.y = event.y - event.yStart + self.startY
		elseif (event.phase == "ended") then
			self:setSequence( "default" )
			self:play( )	
			if (self.hasCollided==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.64
				self.y = H*0.09
				Famous.isVisible = true
				Loveable.isVisible = false
				joyful_box.isVisible = false
				Stinky.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided==false)then
				display.getCurrentStage( ):setFocus( self, nil )
				Famous.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 1190, y = 1425} )
			end	
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.74
				self.y = H*0.17
				self:setSequence( "special" )
				self:play( )
				wielding_box.isVisible = false
				timer.performWithDelay( 5000, function () cleaning_box.isVisible = false end )
				showering_box.isVisible = false
				cleaning_box.isVisible = true
				poking_box.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.16
				self.y = H*0.525
				shower_box.isVisible = false
				clean_box.isVisible = true
				poke_box.isVisible = false
				wield_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () clean_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				cleaning_box.isVisible = false
				clean_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 1570, y = 1225} )
			end
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
			if (self.hasCollided1==true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.22
				self.y = H*0.24
				Broom.isVisible = true
				People.isVisible = false
				Fish.isVisible = false
				Flowers.isVisible = false
				Sword.isVisible = false
				Toys.isVisible = false
				audio.play( correct_sound )
			elseif (self.hasCollided2==true)then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.35
				self.y = H*0.32
				self:setSequence( "special" )
				self:play( )
				toys_box.isVisible = false
					BROOM_SPRITE2 = display.newSprite( BROOM_SHEET, {
					{name = "default", start = 1, count = 1},
					{name = "color", start = 2, count = 1},
					{name = "special", start = 3, count = 1}
					} )
						BROOM_SPRITE2.anchorX = -1
						BROOM_SPRITE2.x = W*0.1
						BROOM_SPRITE2.y = H*0.39
						BROOM_SPRITE2:setSequence( "special" )
						BROOM_SPRITE2:play( )
				flowers_box.isVisible = false
				people_box.isVisible = false
				brooms_box.isVisible = true
				fish_box.isVisible = false
				swords_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () brooms_box.isVisible = false end )
			elseif (self.hasCollided3 == true) then
				display.getCurrentStage( ):setFocus( self, nil )
				self.x = W*0.03
				self.y = H*0.6
				self:setSequence( "special" )
				self:play( )
				brooms2_box.isVisible = true
				fishes_box.isVisible = false
				flowers2_box.isVisible = false
				swords2_box.isVisible = false
				toys2_box.isVisible = false
				audio.play( correct_sound )
				timer.performWithDelay( 5000, function () brooms2_box.isVisible = false end )
			else
				display.getCurrentStage( ):setFocus( self, nil )
				Broom.isVisible = false
				brooms_box.isVisible = false
				brooms2_box.isVisible = false
				audio.play( wrong_sound )
				transition.to( self, {time = 100, x = 1570, y = 1325} )
				if (BROOM_SPRITE2) then
					BROOM_SPRITE2:removeSelf( )
					BROOM_SPRITE2 = nil
				end
			end
		end
	end


	--collision detection
	function adj_1:collision(event)
		if (event.phase == "began") then
			if (event.other.type == "adjective") then
				event.other.hasCollided = true
			end
		elseif (event.phase == "ended") then
			event.other.hasCollided = false
		end
	end

	function verb_1:collision(event)
		if (event.phase == "began") then
			if (event.other.type == "verb") then
				event.other.hasCollided1 = true
			end
		elseif (event.phase == "ended") then
			event.other.hasCollided1 = false
		end
	end

	function verb_2:collision(event)
		if (event.phase == "began") then
			if (event.other.type == "verb") then
				event.other.hasCollided2 = true
			end
		elseif (event.phase == "ended") then
			event.other.hasCollided2 = false
		end
	end

	function noun_1:collision(event)
		if (event.phase == "began") then
			if (event.other.type == "noun") then
				event.other.hasCollided1 = true
			end
		elseif (event.phase == "ended") then
			event.other.hasCollided1 = false
		end
	end

	function noun_2:collision(event)
		if (event.phase == "began") then
			if (event.other.type == "noun") then
				event.other.hasCollided2 = true
			end
		elseif (event.phase == "ended") then
			event.other.hasCollided2 = false
		end
	end

	function noun_22:collision(event)
		if (event.phase == "began") then
			if (event.other.type == "noun") then
				event.other.hasCollided2 = true
			end
		elseif (event.phase == "ended") then
			event.other.hasCollided2 = false
		end
	end

	function noun_3:collision(event)
		if (event.phase == "began") then
			if (event.other.type == "noun") then
				event.other.hasCollided3 = true
			end
		elseif (event.phase == "ended") then
			event.other.hasCollided3 = false
		end
	end

--EVENT LISTENERS
----------------------------------------------
	adj_1:addEventListener( "tap", reveal )
	adj_1:addEventListener( "collision", adj_1 )
	verb_1:addEventListener( "tap", reveal )
	verb_1:addEventListener( "collision", verb_1 )
	noun_1:addEventListener( "tap", reveal )
	noun_1:addEventListener( "collision", noun_1 )
	noun_2:addEventListener( "tap", reveal )
	noun_2:addEventListener( "collision", noun_2 )
	noun_22:addEventListener( "tap", reveal )
	noun_22:addEventListener( "collision", noun_22 )
	verb_2:addEventListener( "tap", reveal )
	verb_2:addEventListener( "collision", verb_2 )
	noun_3:addEventListener( "tap", reveal )
	noun_3:addEventListener( "collision", noun_3 )

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

-- KNIGHT
----------------------------------------------
	local knight = display.newImageRect( "IMAGES/WW_Knight.png", 249, 506 )
		knight.x = W*.91
		knight.y = H-670

--TUTORIAL SEQUENCE
-----------------------------------------------
	local group = display.newGroup( )
	local tut_back = display.newRect( W/2, H/2, W, H )
		tut_back:setFillColor( .2 )
		group:insert( tut_back )
	local tut_title = display.newText( { text = "OH NO! Someone has ruined the Knight's story.", fontSize = 72, font = native.systemFontBold, x = W/2, y = H*0.25, parent = group } )
	local tut_title = display.newText( { text = "To fix the story, touch one of the words and place it is the proper empty space. If you don't know what type of word to put in a space, touch the space and the word type will appear. As you fix the story, the Knight will remember who he is, and both he and his world will begin to change...", fontSize = 52, font = native.systemFont, x = W/2, y = H*0.5, width = W*0.85, parent = group } )
	local play_btn = display.newImage( "IMAGES/play_btn.png", W/2, H*0.75 )
		group:insert(play_btn)

	-- remove TUTORIAL
	function play_btn:touch( event )
		if event.phase== "began" then
			group:removeSelf( )
			audio.play( enter )
			audio.play( bg_musics, {loops = -1} )
		end
	end
	play_btn:addEventListener( "touch", play_btn )
