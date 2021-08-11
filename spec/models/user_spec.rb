require 'rails_helper'

describe User do
	let(:attributes) do
		
		{
			username: "ckingsley113",
			display_name: "Cameron",
			password: "password",
			discord_id: "kingsley113"
		}
	end

	it "creates a valid record" do
		expect(User.new(attributes)).to be_valid
	end

	let(:missing_username) { attributes.except(:username) }
	let(:missing_password) { attributes.except(:password) }
	let(:missing_display_name) { attributes.except(:display_name) }

	it "is invalid without a username" do
		expect(User.new(missing_username)).not_to be_valid
	end

	it "is invalid without a password" do
		expect(User.new(missing_password)).not_to be_valid
	end

	it "can save a display name" do
		expect(User.new(attributes).display_name).not_to be_nil
	end

	it "defaults the display name to the username if left blank" do
		user = User.create(missing_display_name)
		expect(user.display_name).to eq(user.username)
	end


end