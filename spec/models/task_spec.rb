require 'rails_helper'

describe Task do
	let(:user) {User.create(username: "testUser", password:"password",)}
	let(:region) {Region.create(name: "Downtown")}
	
	let(:cell_attributes) do
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

	let(:cell) {Cell.create(cell_attributes)}

	let(:attributes) do
		{
			name: "Rough out buildings",
			description: "Layout teh area and figure out how many buildings to place",
			cell_id: cell.id,
			complete: false
		}
	end
	

	it "creates a valid record" do
		expect(Task.new(attributes)).to be_valid
	end

	let(:missing_name) { attributes.except(:name) }
	let(:missing_cell) { attributes.except(:cell_id) }

	it "is invalid without a name" do
		expect(Task.new(missing_name)).not_to be_valid
	end

	it "is invalid without an cell id" do
		expect(Task.new(missing_cell)).not_to be_valid
	end

	it "has cell assigned to task" do
		expect(Task.create(attributes).cell).to eq(cell)
	end

end