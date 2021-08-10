class User < ApplicationRecord
	# Relationships
	has_many :cells
	has_many :comments

	# Enable Bcrypt password
	has_secure_password

	# Validations
	validates :username, :password, presence: true 
end
