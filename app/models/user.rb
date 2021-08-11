class User < ApplicationRecord
	# Relationships
	has_many :cells
	has_many :comments

	# Enable Bcrypt password
	has_secure_password

	# Validations
	validates :username, :password, presence: true 
	
	# callbacks
	before_create :set_default_display_name
	
	
	private

	def set_default_display_name
		
		if self.display_name.nil?
			self.display_name = self.username
		end
	end

end
