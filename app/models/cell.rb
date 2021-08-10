class Cell < ApplicationRecord
	has_many :tasks
	has_many :comments
	has_many :cell_quests
	has_many :quests, through: :cell_quests

	belongs_to :user

end
