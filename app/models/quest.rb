class Quest < ApplicationRecord
	has_many :cell_quests
	has_many :cells, through: :cell_quests 
end
