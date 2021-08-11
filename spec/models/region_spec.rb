require 'rails_helper'

describe Region do

	let(:attributes) do
		{
			name: "Rough out buildings",
		}
	end
	

	it "creates a valid record" do
		expect(Region.new(attributes)).to be_valid
	end

	let(:missing_name) { attributes.except(:name) }

	it "is invalid without a name" do
		expect(Region.new(missing_name)).not_to be_valid
	end

end