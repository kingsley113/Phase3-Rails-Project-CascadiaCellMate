class User < ApplicationRecord
	has_many :cells
	has_many :comments

	has_secure_password

end
