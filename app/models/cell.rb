class Cell < ApplicationRecord
	include ActiveModel::Validations
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
	# validates_with CoordinateValidator, on: :update

	# callbacks
	before_create :set_adjusted_coordinates
	# before_validation :verify_coordinates
	after_validation :set_slug, only: [:create, :update]

	attr_accessor :create_default_tasks

	# Custom Methods
	def to_param
		self.slug
	end

	def open_tasks
		# binding.pry
		self.tasks.select{ |task| task.complete == false}.count
	end

	def create_default_tasks
		default_tasks = ["Blocked-out", "Cluttered", "Landscape Textures", "Hooked up to interior", "Optimized", "Navmeshed"]
		# have this variable set from admin page??

		default_tasks.each do |task_name|
			task = self.tasks.build(name: task_name)
			task.save
		end
	end

	def valid_coordinates?
		# check if combo of xy coordinates does not already exist
		# find cells with x coordinates
		# binding.pry
		cells = Cell.where(coordinate_x: self.ck_coordinate_x).where(coordinate_y: self.ck_coordinate_y)
		if cells.count > 1
			false
		else
			true
		end
	end

	private

	def set_slug
		self.slug = self.name.parameterize
	end

	def set_adjusted_coordinates
		self.coordinate_x = self.ck_coordinate_x + 35  
		self.coordinate_y = self.ck_coordinate_y + 50  
	end

	def self.search(query)
		where("name like ?", "%#{query}%")
	end

	
end
