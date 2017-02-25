minetest.register_node("craft_clouds:cloud",{
	description = "A Fluffy Cloud",
	drawtype = "normal",
	tiles = {"default_cloud.png"},
	--alpha = 120,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {oddly_breakable_by_hand = 2, crumbly = 1},
})
local cloud_height = 1200
local cloud_depth = 124

local clouds = {
	offset = 0,
	scale = 3,
	spread = {x=40,y=7,z=40},
	octaves = 2,
	seeddiff = 41,
	persist = 0.6,
	lacunarity = 1,
	flags = "eased",
}

local air = minetest.get_content_id("air")
local cloud = minetest.get_content_id("craft_clouds:cloud")

local noisemap

minetest.register_on_generated(function(minp,maxp,chunkseed)
	if minp.y > cloud_height + cloud_depth
	or maxp.y < cloud_height - cloud_depth then
		return
	end

	local vm,emin,emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin,MaxEdge=emax}
	local data = vm:get_data()



	if not noisemap then
		local side_length = maxp.x-minp.x+1
		local chulens = {x=side_length,y=side_length,z=side_length}
		noisemap = minetest.get_perlin_map(clouds,chulens)
	end
	local density_map = noisemap:get3dMap_flat(minp)
	
	local nixyz = 1
	for z=minp.z,maxp.z do
		for y=minp.y,maxp.y do
			local vi = area:index(minp.x,y,z)
			for x=minp.x,maxp.x do
				local density = math.abs(density_map[nixyz]) - 
					math.abs(cloud_height-y)/(cloud_depth*2)
				if data[vi] ~= air
				or y > cloud_height + cloud_depth
				or y < cloud_height - cloud_depth then
				--do nothing
				elseif density > 0.8 then
					data[vi] = cloud
				end
				nixyz = nixyz + 1
				vi = vi + 1
			end
		end
	end

	vm:set_data(data)
	vm:set_lighting({day=0,night=0})
	vm:calc_lighting()
	vm:write_to_map(data)
end)
