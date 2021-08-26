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
testcells = Region.create(name: "Test Cells")

# Users
cam = User.create(username: "kingsley113", password: "12345", display_name: "Cameron", accent_color: "#f94fdd")
jimmy = User.create(username: "jimmyd413", password: "12345", display_name: "Jimmy Diresta", accent_color: "#1fbef5")
bob = User.create(username: "bclagmeister12", password: "12345", accent_color: "#c04e10")
david = User.create(username: "DPiccutio", password: "12345", display_name: "D Man 56", accent_color: "#7fe061")

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
	percent_complete: 20, 
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
	ck_coordinate_x: 50, 
	ck_coordinate_y: -32, 
	user_id: bob.id, 
	region_id: ash.id, 
	percent_complete: 50, 
	interior: false,
	priority: "Low"
)

Cell.create(
	name: "Covington", 
	description: "Town of covington", 
	ck_coordinate_x: 48, 
	ck_coordinate_y: -34, 
	user_id: david.id, 
	region_id: ash.id, 
	percent_complete: 10, 
	interior: false,
	priority: "Low"
)

Cell.create(
	name: "Bellevue", 
	description: "Ground zero of the war, crater of bellevue", 
	ck_coordinate_x: 42, 
	ck_coordinate_y: 26, 
	user_id: bob.id, 
	region_id: east.id, 
	percent_complete: 60, 
	interior: false,
	priority: "High"
)

# Test cells for corner and image calibration
Cell.create(
	name: "Test - Corner1",	ck_coordinate_x: -32, ck_coordinate_y: 32, region_id: testcells.id, color: "yellow")
Cell.create(
	name: "Test - Corner2", ck_coordinate_x: 58, ck_coordinate_y: 32, region_id: testcells.id, color: "yellow")
Cell.create(
	name: "Test - Corner3", ck_coordinate_x: 58, ck_coordinate_y: -44, region_id: testcells.id, color: "yellow")
Cell.create(
	name: "Test - Corner4", ck_coordinate_x: -32, ck_coordinate_y: -44, region_id: testcells.id, color: "yellow")
Cell.create(
	name: "Test - Center 0 0", ck_coordinate_x: 0, ck_coordinate_y: 0, region_id: testcells.id,color: "red")

	# Testing the vertical axis alignment
Cell.create(
	name: "Test - Y Axis 0", ck_coordinate_x: 35, ck_coordinate_y: 32, region_id: testcells.id)
Cell.create(
	name: "Test - Y Axis 1", ck_coordinate_x: 35, ck_coordinate_y: 23, region_id: testcells.id)
Cell.create(
	name: "Test - Y Axis 2", ck_coordinate_x: 35,	ck_coordinate_y: 13, region_id: testcells.id)
Cell.create(
	name: "Test - Y Axis 3", ck_coordinate_x: 35,	ck_coordinate_y: 3,	region_id: testcells.id)
Cell.create(
	name: "Test - Y Axis 4", ck_coordinate_x: 35,	ck_coordinate_y: -7, region_id: testcells.id)
Cell.create(
	name: "Test - Y Axis 5", ck_coordinate_x: 35, ck_coordinate_y: -17, region_id: testcells.id)
Cell.create(
	name: "Test - Y Axis 6", ck_coordinate_x: 35, ck_coordinate_y: -27, region_id: testcells.id)
Cell.create(
	name: "Test - Y Axis 7", ck_coordinate_x: 35, ck_coordinate_y: -37, region_id: testcells.id)

	# Testing the spacing of grid cells to background
Cell.create(
	name: "Test - Group 1", ck_coordinate_x: 5, ck_coordinate_y: 5, region_id: testcells.id)	
Cell.create(
	name: "Test - Group 2", ck_coordinate_x: 7, ck_coordinate_y: 5, region_id: testcells.id)	
Cell.create(
	name: "Test - Group 3", ck_coordinate_x: 3, ck_coordinate_y: 5, region_id: testcells.id)	
Cell.create(
	name: "Test - Group 4", ck_coordinate_x: 5, ck_coordinate_y: 7, region_id: testcells.id)	
Cell.create(
	name: "Test - Group 5", ck_coordinate_x: 5, ck_coordinate_y: 3, region_id: testcells.id)	
Cell.create(
	name: "Test - Group 6", ck_coordinate_x: 5, ck_coordinate_y: 9, region_id: testcells.id)	
											
	# Actual Cells from CK


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