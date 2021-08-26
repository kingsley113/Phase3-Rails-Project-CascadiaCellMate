class Cell < ApplicationRecord
	include ActiveModel::Validations
	# Relationships
	has_many :tasks
	has_many :comments
	has_many :cell_quests
	has_many :quests, through: :cell_quests

	belongs_to :user, optional: true
	belongs_to :region

	# Validations
	validates :name, :region_id, presence: true
	validates :name, uniqueness: true
	validates :ck_coordinate_x, inclusion: {in: -32..58, message: 'must be between -32 and 58.'} 
	validates :ck_coordinate_y, inclusion: {in: -44..32, message: 'must be between -44 and 32.'}

	validates_with CoordinateValidator, on: [:create, :update], message: 'Put some address please'

	# callbacks
	before_create :set_adjusted_coordinates
	after_validation :set_slug, only: [:create, :update]

	attr_accessor :create_default_tasks, :cell

	# Custom Methods
	def to_param
		self.slug
	end

	def open_tasks
		self.tasks.select{ |task| task.complete == false}.count
	end

	def create_default_tasks
		default_tasks = ["Blocked-out", "Cluttered", "Landscape Textures", "Hooked up to interior", "Optimized", "Navmeshed"]

		default_tasks.each do |task_name|
			task = self.tasks.build(name: task_name)
			task.save
		end
	end

	def self.cell_progress
		Cell.group(:percent_complete).count
	end

	private

	def set_slug
		self.slug = self.name.parameterize
	end

	def set_adjusted_coordinates
		# Set X grid coordinate
		self.coordinate_x = self.ck_coordinate_x + 33
		# Set Y grid coordinate 
		self.coordinate_y = 78 - (self.ck_coordinate_y + 45) 
		# Top cell 32, bottom cell -44 = 77 total height
	end

	def self.search(query)
		where("name like ?", "%#{query}%")
	end

	def self.all_by_name
		@cells = Cell.all.sort_by{ |cell| cell.name}
	end
end
