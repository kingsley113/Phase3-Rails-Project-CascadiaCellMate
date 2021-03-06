require 'rails_helper'

describe Comment do
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
			content: "This is a really important cell to finish, we should team up and work on it asap!",
			user_id: user.id,
			cell_id: cell.id
		}
	end
	

	it "creates a valid record" do
		expect(Comment.new(attributes)).to be_valid
	end

	let(:missing_user) { attributes.except(:user_id) }
	let(:missing_cell) { attributes.except(:cell_id) }

	it "is invalid without a user id" do
		expect(Comment.new(missing_user)).not_to be_valid
	end

	it "is invalid without an cell id" do
		expect(Comment.new(missing_cell)).not_to be_valid
	end

	it "has user assigned to comment" do
		expect(Comment.create(attributes).user).to eq(user)
	end

	it "has cell assigned to comment" do
		expect(Comment.create(attributes).cell).to eq(cell)
	end

end