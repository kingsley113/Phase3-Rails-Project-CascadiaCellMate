require 'rails_helper'

describe Cell do
	let(:user) {User.create(username: "testUser", password:"password")}
	let(:region) {Region.create(name: "Downtown")}

	let(:attributes) do
		{
			name: "DowntownSeattle01",
			description: "This is one of the main downtown cells for the Seattle waterfront",
			priority: 4,
			ck_coordinate_x: -10,
			ck_coordinate_y: 13,
			user_id: user.id,
			region_id: region.id,
			percent_complete: 35,
			interior: false,
			color: "ffffff"
		}
	end

	

	it "creates a valid record" do
		expect(Cell.new(attributes)).to be_valid
	end

	let(:missing_name) { attributes.except(:name) }
	let(:missing_x_coordinate) { attributes.except(:ck_coordinate_x) }
	let(:missing_y_coordinate) { attributes.except(:ck_coordinate_y) }
	let(:missing_region) { attributes.except(:region_id) }

	it "is invalid without a name" do
		expect(Cell.new(missing_name)).not_to be_valid
	end

	it "is invalid without an X coordinate" do
		expect(Cell.new(missing_x_coordinate)).not_to be_valid
	end

	it "is invalid without a Y coordinate" do
		expect(Cell.new(missing_y_coordinate)).not_to be_valid
	end

	it "is invalid without a region" do
		expect(Cell.new(missing_region)).not_to be_valid
	end

	it "calculates and saves the adjusted X coordinate from the original X coordinate" do
		cell = Cell.create(attributes)
		expect(cell.coordinate_x).to eq(cell.ck_coordinate_x + 30)
	end

	it "calculates and saves the adjusted Y coordinate from the original Y coordinate" do
		cell = Cell.create(attributes)
		expect(cell.coordinate_y).to eq(cell.ck_coordinate_y + 30)
	end


end