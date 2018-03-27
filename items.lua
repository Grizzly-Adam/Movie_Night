minetest.register_node("movienight:projector_stand", {
	description = "Projector Stand",
	tiles = {
		"movienight_projector_stand.png"
	},
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- Top
			{-0.3125, -0.3125, -0.5, -0.375, 0.375, -0.375}, -- Leg
			{0.3125, -0.3125, -0.5, 0.375, 0.375, -0.375}, -- Leg
			{-0.3125, -0.3125, 0.5, -0.375, 0.375, 0.375}, -- Leg
			{0.3125, -0.3125, 0.5, 0.375, 0.375, 0.375}, -- Leg
			{-0.375, -0.25, -0.375, -0.3125, -0.1875, 0.40625}, -- Middle Side
			{0.375, -0.25, -0.375, 0.3125, -0.1875, 0.40625}, -- Middle Side
			{-0.375, -0.25, -0.4375, 0.375, -0.1875, -0.1875}, -- Middle Front
		}
	}
})

minetest.register_node("movienight:movie_projector", {
	description = "Movie Projector",
	tiles = {
		"movienight_projector_top.png", --top
		"movienight_projector_side.png", --bottom
		"movienight_projector_side.png^[transformFx",
		"movienight_projector_side.png",
		"movienight_projector_front.png^[transformFy", --back
		"movienight_projector_front.png" --front
	},
	groups = {cracky=2},
	sounds = default.node_sound_metal_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, -0.3125, 0.5, -0.0625, 0.5}, -- Main
			{-0.25, -0.375, -0.375, 0.0, -0.125, -0.3125}, -- Lens
			{0.375, -0.5, 0.375, 0.4375, -0.4375, 0.4375}, -- NodeBox3
			{-0.4375, -0.5, 0.375, -0.375, -0.4375, 0.4375}, -- NodeBox4
			{-0.4375, -0.5, -0.25, -0.375, -0.4375, -0.1875}, -- NodeBox5
			{0.375, -0.5, -0.25, 0.4375, -0.4375, -0.1875}, -- NodeBox6
		}
	}
})

-- Popcorn
minetest.register_craftitem("movienight:popcorn", {
	description = ("Bag of Popcorn"),
	inventory_image = "movienight_popcorn.png",
	on_use = food.item_eat(4),
})

-- Butter
minetest.register_craftitem("movienight:butter", {
	description = ("Butter"),
	inventory_image = "movienight_butter.png",
	groups = {food_butter=1},
})

minetest.register_craft({
	output = 'movienight:butter',
	recipe = {
	{'group:food_milk', 'group:food_milk'}
	}
})

minetest.register_craft({
	output = 'movienight:butter',
	recipe = {
{"group:food_milk","group:food_milkbucket"}
	}
})

minetest.register_craft({
	output = 'movienight:butter',
	recipe = {
{"group:food_milkbucket","group:food_milkbucket"}
	}
})
