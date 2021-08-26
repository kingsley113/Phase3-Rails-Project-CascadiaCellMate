class Task < ApplicationRecord
	# Relationships
	belongs_to :cell

	# Validations
	validates :name, :cell_id, presence: true 

	# Callbacks
	before_create :set_complete_to_false

	def set_complete_to_false
		self.complete = false
	end
end
