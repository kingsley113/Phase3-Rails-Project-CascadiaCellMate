class User < ApplicationRecord
	# Relationships
	has_many :cells
	has_many :comments

	# Enable Bcrypt password
	has_secure_password

	# Validations
	validates :username, :password, presence: true 
	validates :username, :slug, uniqueness: true
	
	# callbacks
	before_create :set_default_display_name
	after_validation :set_slug, only: [:create, :update]
	
	def to_param
		self.slug
	end

	private

	def set_default_display_name
		if self.display_name.nil?
			self.display_name = self.username
		end
	end

	def set_slug
		self.slug = self.username.parameterize
	end

end
