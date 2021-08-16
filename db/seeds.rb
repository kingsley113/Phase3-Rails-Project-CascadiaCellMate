# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Regions
ns = Region.create(name: "North Seattle")
dt = Region.create(name: "Downtown Seattle")
ash = Region.create(name: "Ashlands")
Region.create(name: "Issaquah Alps")
east = Region.create(name: "Eastside")

# Users
cam = User.create(username: "kingsley113", password: "12345", display_name: "Cameron")
jimmy = User.create(username: "jimmyd413", password: "12345", display_name: "Jimmy Diresta")
bob = User.create(username: "bclagmeister12", password: "12345")
david = User.create(username: "DPiccutio", password: "12345", display_name: "D Man 56")

# Cells
Cell.create(
	name: "DowntownWaterfront", 
	description: "Waterfront area of Seattle", 
	ck_coordinate_x: 23, 
	ck_coordinate_y: 13, 
	user_id: cam.id, 
	region_id: dt.id, 
	percent_complete: 10, 
	interior: false,
	priority: "High"
)

Cell.create(
	name: "SpaceNeedle", 
	description: "The Space Needle....", 
	ck_coordinate_x: 25, 
	ck_coordinate_y: 11, 
	user_id: cam.id, 
	region_id: ns.id, 
	percent_complete: 25, 
	interior: false,
	priority: "Urgent"
)

Cell.create(
	name: "RainierUniversity", 
	description: "The UW area of Seattle", 
	ck_coordinate_x: 23, 
	ck_coordinate_y: 10, 
	user_id: jimmy.id, 
	region_id: ns.id, 
	percent_complete: 10, 
	interior: false,
	priority: "Medium"
)

Cell.create(
	name: "Buckley", 
	description: "Ruin town of buckley at south end of map", 
	ck_coordinate_x: 67, 
	ck_coordinate_y: 68, 
	user_id: bob.id, 
	region_id: ash.id, 
	percent_complete: 50, 
	interior: false,
	priority: "Low"
)

Cell.create(
	name: "Covington", 
	description: "Town of covington", 
	ck_coordinate_x: 67, 
	ck_coordinate_y: 69, 
	user_id: david.id, 
	region_id: ash.id, 
	percent_complete: 10, 
	interior: false,
	priority: "Low"
)

Cell.create(
	name: "Bellevue", 
	description: "Ground zero of the war, crater of bellevue", 
	ck_coordinate_x: 54, 
	ck_coordinate_y: 26, 
	user_id: bob.id, 
	region_id: east.id, 
	percent_complete: 65, 
	interior: false,
	priority: "High"
)

# Test cells for corner and image calibration
Cell.create(
	name: "Test - Corner1", 
	ck_coordinate_x: -35, 
	ck_coordinate_y: 33, 
	region_id: east.id, 
)

Cell.create(
	name: "Test - Corner2", 
	ck_coordinate_x: 56, 
	ck_coordinate_y: 33, 
	region_id: east.id, 
)

Cell.create(
	name: "Test - Corner3", 
	ck_coordinate_x: 56, 
	ck_coordinate_y: -49, 
	region_id: east.id, 
)

Cell.create(
	name: "Test - Corner4", 
	ck_coordinate_x: -35, 
	ck_coordinate_y: -49, 
	region_id: east.id, 
)

Cell.create(
	name: "Test - Center 0 0", 
	ck_coordinate_x: 0, 
	ck_coordinate_y: 0, 
	region_id: east.id, 
)


# Tasks
Cell.all.each do |cell| 
	Task.create(name: "Block out buildings", cell_id: cell.id)
	Task.create(name: "Create Navmesh", cell_id: cell.id)
	Task.create(name: "Paint Textures", cell_id: cell.id)
	Task.create(name: "Add Clutter", cell_id: cell.id)
	Task.create(name: "Playtest and Debug", cell_id: cell.id)
end

# Quests
	# TBD
# Comments
	# TBD