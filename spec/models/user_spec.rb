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
end