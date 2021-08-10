class User < ApplicationRecord
	has_many :cells
	has_many :comments

	
end
