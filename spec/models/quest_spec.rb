require 'rails_helper'

describe Quest do
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
			name: "Super Fun Quest",
			description: "A really fun quest thats part of the main storyline",
			wiki_link: "www.This_would_be_the_link_if_it_existed.com" 
		}
	end
	

	it "creates a valid record" do
		expect(Quest.new(attributes)).to be_valid
	end

	let(:missing_name) { attributes.except(:name) }

	it "is invalid without a name" do
		expect(Quest.new(missing_name)).not_to be_valid
	end
	
	it "can have cell associated with quest" do
		quest = Quest.create(attributes)
		quest.cells << cell
		expect(quest.cells).to include(cell)
	end

end