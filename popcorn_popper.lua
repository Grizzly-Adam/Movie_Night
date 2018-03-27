minetest.register_node('movienight:popcorn_popper', {
	description = 'Popcorn Popper',
	tiles = {
		"movienight_popper_top.png",
		"movienight_popper_bottom.png",
		"movienight_popper.png",
		"movienight_popper.png",
		"movienight_popper.png",
		"movienight_popper.png"
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 1.5, 0.5}, -- Kettle Top
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- Kettle Bottom
			{-0.3125, 0.5, -0.3125, 0.3125, 0.5625, 0.3125}, -- Popcorn Base
			{-0.1875, 0.5, -0.1875, 0.1875, 0.5625, 0.1875}, -- Popcorn Top
			{-0.5, -0.5, -0.5, -0.4375, .5, -0.4375}, -- front left leg
			{0.5, -0.5, -0.5, 0.4375, .5, -0.4375}, -- front right leg
			{-0.5, -0.5, 0.5, -0.43753125, .5, 0.4375}, -- rear left leg
			{0.5, -0.5, 0.5, 0.4375, .5, 0.4375}, -- rear right leg
		}
	},
	sounds = default.node_sound_metal_defaults(),
	groups = {oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',

can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if player:get_player_name() == meta:get_string("owner") and

	   inv:is_empty("corn") and
	   inv:is_empty("butter") and
	   inv:is_empty("salt") and
	   inv:is_empty("popcorn") then
		return true
	else
	return false
	end
end,

after_place_node = function(pos, placer, itemstack)
	local meta = minetest.get_meta(pos)
		local timer = minetest.get_node_timer(pos)
	meta:set_string("owner",placer:get_player_name())
	meta:set_string("infotext","Popcorn Popper (owned by "..placer:get_player_name()..")")
	timer:start(10)
	end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "invsize[9,10;]"..
		--Ingredients
		"label[1.5,0.5;Instructions:]"..
		"label[2.5625,0.5;1. Add corn, butter, and salt.]"..
		"label[2.5625,.75;2. Wait for kernals to pop.]"..
		"label[2.5625,1.0;3. Enjoy fresh popcorn!]"..
		"list[current_name;corn;1.5,2.5;1,1;]"..
		"label[1.5,2.0;Corn]"..
		"list[current_name;butter;3.5,2.5;1,1;]"..
		"label[3.5,2.0;Butter]"..
		"list[current_name;salt;5.5,2.5;1,1;]"..
		"label[5.5,2.0;Salt]"..
		--Output
		"list[current_name;popcorn;5.5,4.5;1,1;]"..
		"label[5.5,4.0;Output]"..

		--Players Inventory
		"list[current_player;main;0.5,6;8,4;]")
	meta:set_string("infotext", "Popcorn Popper")
	local inv = meta:get_inventory()

	inv:set_size("corn", 1)
	inv:set_size("butter", 1)
	inv:set_size("salt", 1)
	inv:set_size("popcorn", 1)
end,

on_timer = function(pos)
		local timer 	=	minetest.get_node_timer(pos)
		local meta 	= 	minetest.get_meta(pos)
		local inv 	= 	meta:get_inventory()
		local corn 	= 	inv:get_stack("corn", 1)
		local butter = 	inv:get_stack("butter", 1)
		local salt 	= 	inv:get_stack("salt", 1)

----------------------------------------------------------------------
	if minetest.get_item_group(corn:get_name(), "food_corn") > 0 and
		minetest.get_item_group(butter:get_name(), "food_butter") > 0 and
		minetest.get_item_group(salt:get_name(), "food_salt") > 0 then
		    minetest.sound_play("popping")
			corn:take_item()
			inv:set_stack("corn",1,corn)
			butter:take_item()
			inv:set_stack("butter",1,butter)
			salt:take_item()
			inv:set_stack("salt",1,salt)
minetest.after(10, function()
			inv:add_item("popcorn","movienight:popcorn")
end)

	end
	timer:start(1)
end,
})



