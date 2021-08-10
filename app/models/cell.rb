class Cell < ApplicationRecord
	# Relationships
	has_many :tasks
	has_many :comments
	has_many :cell_quests
	has_many :quests, through: :cell_quests

	belongs_to :user

	# This is used to link an interior cell to an exterior cell Id, and also give exterior cells list of interiors
	belongs_to parent:, :class_name => :cell, :foreign_key => "exterior_cell_id"
	has_many :child_cells, :class_name => :cell, :foreign_key => "exterior_cell_id"

end
