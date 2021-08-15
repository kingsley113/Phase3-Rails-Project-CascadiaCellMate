class Cell < ApplicationRecord
	# Relationships
	has_many :tasks
	has_many :comments
	has_many :cell_quests
	has_many :quests, through: :cell_quests

	belongs_to :user, optional: true
	belongs_to :region

	# This is used to link an interior cell to an exterior cell Id, and also give exterior cells list of interiors
	# belongs_to parent: :class_name => :cell, :foreign_key => "exterior_cell_id"
	# has_many :child_cells, :class_name => :cell, :foreign_key => "exterior_cell_id"

	# Validations
	validates :name, :ck_coordinate_x, :ck_coordinate_y, :region_id, presence: true
	validates :slug, uniqueness: true
	

	# callbacks
	before_create :set_adjusted_coordinates
	after_validation :set_slug, only: [:create, :update]

	attr_accessor :create_default_tasks

	def to_param
		self.slug
	end


	private

	def set_slug
		self.slug = self.name.parameterize
	end

	def set_adjusted_coordinates
		self.coordinate_x = self.ck_coordinate_x + 30 # TODO: figure out the exact offset
		self.coordinate_y = self.ck_coordinate_y + 30 # TODO: figure out the exact offset
	end

	def self.search(query)
		where("name like ?", "%#{query}%")
	end

end
