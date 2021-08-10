class Task < ApplicationRecord
	# Relationships
	belongs_to :cell

	# Validations
	validates :name, :cell_id, presence: true 
end
