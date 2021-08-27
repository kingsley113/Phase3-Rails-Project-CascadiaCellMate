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
ws = Region.create(name: "West Seattle")
east = Region.create(name: "Eastside")
testcells = Region.create(name: "Test Cells")

sv = Region.create(name: "Snoqualmie Valley")
ia = Region.create(name: "Issaquah Alps")
ash = Region.create(name: "Ashlands")
des = Region.create(name: "Des Moines")
bell = Region.create(name: "Bellevue")

# Users
cam = User.create(username: "kingsley113test", password: "12345", display_name: "Cam", accent_color: "#f94fdd")
jimmy = User.create(username: "jimmyd413", password: "12345", display_name: "Jimmy Diresta", accent_color: "#1fbef5")
bob = User.create(username: "bclagmeister12", password: "12345", accent_color: "#c04e10")
david = User.create(username: "DPiccutio", password: "12345", display_name: "David P", accent_color: "#7fe061")

# Cells
# Cell.create(name: "DowntownWaterfront", description: "Waterfront area of Seattle", ck_coordinate_x: 23, ck_coordinate_y: 13, user_id: cam.id, region_id: dt.id, percent_complete: 10, interior: false, priority: "High")
# Cell.create(name: "SpaceNeedle", description: "The Space Needle....", ck_coordinate_x: 25, ck_coordinate_y: 11, user_id: cam.id, region_id: ns.id, percent_complete: 20, interior: false, priority: "Urgent")
# Cell.create(name: "Buckley", description: "Ruin town of buckley at south end of map", ck_coordinate_x: 50, ck_coordinate_y: -32, user_id: bob.id, region_id: ash.id, percent_complete: 50, interior: false, priority: "Low")
# Cell.create(name: "Covington", description: "Town of covington", ck_coordinate_x: 48, ck_coordinate_y: -34, user_id: david.id, region_id: ash.id, percent_complete: 10, interior: false,	priority: "Low")
# Cell.create(name: "Bellevue", description: "Ground zero of the war, crater of bellevue", ck_coordinate_x: 42, ck_coordinate_y: 26, user_id: bob.id, region_id: east.id, percent_complete: 60, interior: false, priority: "High")

# Test cells for corner and image calibration
Cell.create(name: "Test - Corner1",	ck_coordinate_x: -32, ck_coordinate_y: 32, region_id: testcells.id, color: "yellow")
Cell.create(name: "Test - Corner2", ck_coordinate_x: 58, ck_coordinate_y: 32, region_id: testcells.id, color: "yellow")
Cell.create(name: "Test - Corner3", ck_coordinate_x: 58, ck_coordinate_y: -44, region_id: testcells.id, color: "yellow")
Cell.create(name: "Test - Corner4", ck_coordinate_x: -32, ck_coordinate_y: -44, region_id: testcells.id, color: "yellow")
Cell.create(name: "Test - Center 0 0", ck_coordinate_x: 0, ck_coordinate_y: 0, region_id: testcells.id,color: "red")

	# Testing the vertical axis alignment
# Cell.create(name: "Test - Y Axis 0", ck_coordinate_x: 35, ck_coordinate_y: 32, region_id: testcells.id)
# Cell.create(name: "Test - Y Axis 1", ck_coordinate_x: 35, ck_coordinate_y: 23, region_id: testcells.id)
# Cell.create(name: "Test - Y Axis 2", ck_coordinate_x: 35,	ck_coordinate_y: 13, region_id: testcells.id)
# Cell.create(name: "Test - Y Axis 3", ck_coordinate_x: 35,	ck_coordinate_y: 3,	region_id: testcells.id)
# Cell.create(name: "Test - Y Axis 4", ck_coordinate_x: 35,	ck_coordinate_y: -7, region_id: testcells.id)
# Cell.create(name: "Test - Y Axis 5", ck_coordinate_x: 35, ck_coordinate_y: -17, region_id: testcells.id)
# Cell.create(name: "Test - Y Axis 6", ck_coordinate_x: 35, ck_coordinate_y: -27, region_id: testcells.id)
# Cell.create(name: "Test - Y Axis 7", ck_coordinate_x: 35, ck_coordinate_y: -37, region_id: testcells.id)

	# Testing the spacing of grid cells to background
# Cell.create(name: "Test - Group 1", ck_coordinate_x: 5, ck_coordinate_y: 5, region_id: testcells.id)	
# Cell.create(name: "Test - Group 2", ck_coordinate_x: 7, ck_coordinate_y: 5, region_id: testcells.id)	
# Cell.create(name: "Test - Group 3", ck_coordinate_x: 3, ck_coordinate_y: 5, region_id: testcells.id)	
# Cell.create(name: "Test - Group 4", ck_coordinate_x: 5, ck_coordinate_y: 7, region_id: testcells.id)	
# Cell.create(name: "Test - Group 5", ck_coordinate_x: 5, ck_coordinate_y: 3, region_id: testcells.id)	
# Cell.create(name: "Test - Group 6", ck_coordinate_x: 5, ck_coordinate_y: 9, region_id: testcells.id)	
											
	# Actual Cells from CK
	Cell.create(name: "The Lodge", ck_coordinate_x: 49, ck_coordinate_y: -4, user_id: cam.id, region_id: sv.id, percent_complete: 50, interior: false, priority: "High")
	Cell.create(name: "Glowing Van", description: "Glowing van", ck_coordinate_x: 47, ck_coordinate_y: -10, user_id: jimmy.id, region_id: ia.id, percent_complete: 30, interior: false, priority: "High")
	Cell.create(name: "Firewatch Tower", description: "Firewatch tower", ck_coordinate_x: 47, ck_coordinate_y: -27, user_id: bob.id, region_id: ia.id, percent_complete: 80, interior: false, priority: "Low")
	Cell.create(name: "Ren Fair", description: "Ren fair", ck_coordinate_x: 40, ck_coordinate_y: 30, user_id: david.id, region_id: sv.id, percent_complete: 60, interior: false, priority: "High")
	Cell.create(name: "Carnation", description: "Town of Carnation", ck_coordinate_x: 40, ck_coordinate_y: 15, user_id: jimmy.id, region_id: sv.id, percent_complete: 40, interior: false, priority: "High")
	Cell.create(name: "Carnation School", description: "Carnation school", ck_coordinate_x: 40, ck_coordinate_y: 18, user_id: cam.id, region_id: sv.id, percent_complete: 70, interior: false, priority: "High")
	Cell.create(name: "Buckley", description: "Ruins of buckley", ck_coordinate_x: 32, ck_coordinate_y: -39, user_id: cam.id, region_id: ash.id, percent_complete: 30, interior: false, priority: "Low")
	Cell.create(name: "Tiger Mountain Summit", description: "summit of tiger mountain", ck_coordinate_x: 31, ck_coordinate_y: -11, user_id: cam.id, region_id: ia.id, percent_complete: 40, interior: false, priority: "Medium")
	Cell.create(name: "Covington Mine", description: "Covington Mine excavation", ck_coordinate_x: 28, ck_coordinate_y: -37, user_id: jimmy.id, region_id: ash.id, percent_complete: 20, interior: false, priority: "Low")
	Cell.create(name: "Poo Poo Peak", description: "Poo Poo peak", ck_coordinate_x: 27, ck_coordinate_y: -12, user_id: cam.id, region_id: ia.id, percent_complete: 60, interior: false, priority: "Medium")
	Cell.create(name: "Covington Industrial", description: "Covington industrial area", ck_coordinate_x: 27, ck_coordinate_y: -42, user_id: cam.id, region_id: ash.id, percent_complete: 50, interior: false, priority: "Low")
	Cell.create(name: "Redmond Stables", description: "Redmond stables, for horses...", ck_coordinate_x: 24, ck_coordinate_y: 29, user_id: bob.id, region_id: east.id, percent_complete: 40, interior: false, priority: "Low")
	Cell.create(name: "Redmond Train Station", description: "Redmond train station", ck_coordinate_x: 19, ck_coordinate_y: 13, user_id: jimmy.id, region_id: east.id, percent_complete: 20, interior: false, priority: "High")
	Cell.create(name: "Cedar River", description: "cedar river area", ck_coordinate_x: 15, ck_coordinate_y: -18, user_id: jimmy.id, region_id: ia.id, percent_complete: 80, interior: false, priority: "Low")
	Cell.create(name: "Cougar Settlement", description: "Cougar settlement", ck_coordinate_x: 15, ck_coordinate_y: -10, user_id: cam.id, region_id: ia.id, percent_complete: 30, interior: false, priority: "Medium")
	Cell.create(name: "Lumber Mill Ext 01", description: "lumber mill 1", ck_coordinate_x: 12, ck_coordinate_y: -20, user_id: david.id, region_id: ash.id, percent_complete: 50, interior: false, priority: "Low")
	Cell.create(name: "Mine Trainyard Ext 11", description: "mine trainyard 11", ck_coordinate_x: 11, ck_coordinate_y: -25, user_id: david.id, region_id: des.id, percent_complete: 30, interior: false, priority: "High")
	Cell.create(name: "Sinkhole East", description: "sinkhole", ck_coordinate_x: 9, ck_coordinate_y: 22, user_id: jimmy.id, region_id: sv.id, percent_complete: 40, interior: false, priority: "Urgent")
	Cell.create(name: "Hunts Point", description: "Hunts point, where all the rich people live", ck_coordinate_x: 2, ck_coordinate_y: 15, user_id: cam.id, region_id: bell.id, percent_complete: 50, interior: false, priority: "Medium")
	Cell.create(name: "Pike Place", description: "Pike Place Market", ck_coordinate_x: -19, ck_coordinate_y: 8, user_id: cam.id, region_id: dt.id, percent_complete: 80, interior: false, priority: "Urgent")
	Cell.create(name: "Space Museum", description: "Downtown space museum", ck_coordinate_x: -19, ck_coordinate_y: 12, user_id: cam.id, region_id: dt.id, percent_complete: 70, interior: false, priority: "Low")
	Cell.create(name: "Ferry Dock", description: "Waterfront ferry dock", ck_coordinate_x: -20, ck_coordinate_y: 4, user_id: jimmy.id, region_id: dt.id, percent_complete: 60, interior: false, priority: "Medium")
	Cell.create(name: "West Seattle Treehouse", description: "west seattle treehouse", ck_coordinate_x: -23, ck_coordinate_y: -12, user_id: bob.id, region_id: ws.id, percent_complete: 100, interior: false, priority: "High")
	Cell.create(name: "Harbor Island", description: "harbor island", ck_coordinate_x: -24, ck_coordinate_y: 0, user_id: cam.id, region_id: dt.id, percent_complete: 70, interior: false, priority: "Medium")
	Cell.create(name: "Queen Anne", description: "queen anne hill", ck_coordinate_x: -24, ck_coordinate_y: 13, user_id: david.id, region_id: dt.id, percent_complete: 50, interior: false, priority: "Urgent")
	Cell.create(name: "Ballard Locks Ext 01", description: "ballard locks", ck_coordinate_x: -25, ck_coordinate_y: 18, user_id: jimmy.id, region_id: dt.id, percent_complete: 40, interior: false, priority: "High")
	Cell.create(name: "West Seattle Downtown", description: "downtown of west seattle", ck_coordinate_x: -26, ck_coordinate_y: -7, user_id: cam.id, region_id: dt.id, percent_complete: 20, interior: false, priority: "Low")
	Cell.create(name: "Fort Lawton", description: "Fort lawton 'park'...", ck_coordinate_x: -28, ck_coordinate_y: 17, user_id: david.id, region_id: dt.id, percent_complete: 10, interior: false, priority: "High")
	Cell.create(name: "Woodland Park Zoo", description: "The zoooooo!!!", ck_coordinate_x: -23, ck_coordinate_y: 21, user_id: david.id, region_id: dt.id, percent_complete: 90, interior: false, priority: "High")
	Cell.create(name: "RainierUniversity", description: "The UW area of Seattle", ck_coordinate_x: -17, ck_coordinate_y: 20, user_id: jimmy.id, region_id: ns.id, percent_complete: 10, interior: false,	priority: "Medium")

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