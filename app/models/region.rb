class Region < ApplicationRecord
	# Relationships
	has_many :cells

	# Validations
	validates :name, presence: true
end
