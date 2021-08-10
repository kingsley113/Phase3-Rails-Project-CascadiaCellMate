class Quest < ApplicationRecord
	# Relationships
	has_many :cell_quests
	has_many :cells, through: :cell_quests 

	# Validations
	validates :name, presence: true
	
end
