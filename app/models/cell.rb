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
	validates :ck_coordinate_x, inclusion: {in: -32..58, message: 'must be between -32 and 58.'} 
	validates :ck_coordinate_y, inclusion: {in: -44..32, message: 'must be between -44 and 32.'}


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

	# def valid_coordinates?
	# 	# check if combo of xy coordinates does not already exist
	# 	# find cells with x coordinates
	# 	# binding.pry
	# 	cells = Cell.where(coordinate_x: self.ck_coordinate_x).where(coordinate_y: self.ck_coordinate_y)
	# 	if cells.count > 1
	# 		false
	# 	else
	# 		true
	# 	end
	# end

	# def progress
	# 	self.percent_complete.to_i
	# end

	def self.cell_progress
		# @data = {percent_0: nil, percent_10: nil, percent_20: nil, percent_30: nil, percent_40: nil, percent_50: nil, percent_60: nil, percent_70: nil, percent_80: nil, percent_90: nil, percent_100: nil}
		# # get all cells
		# @cells = Cell.all
		# # count how many cells have each % complete
		# @data.each_with_index do |category, i|
		# 	binding.pry
		# 	percentage = category.delete("percent_")
		# 	@cells.select{ |cell| cell.percent_complete == ("#{i}0")}
		# end
		# save that result to an array of hashes
		# return an array of hashes for use by the chart
		# {progress-0: 12, progress-10: 3, progress-20: 13 ...} etc.
		# binding.pry
		# data = [
		# 	['Genre', 'Fantasy & Sci Fi', 'Romance', 'Mystery/Crime', 'General', 'Western', 'Literature', { role: 'annotation' } ],
		# 	{'2010': [10, 24, 20, 32, 18, 5] },
		# 	['2020', 16, 22, 23, 30, 16, 9, ''],
		# 	['2030', 28, 19, 29, 30, 12, 13, '']
		# ]


		# data = [
		# 	{name: "Percentage", data: Cell.group(:percent_complete).count.to_a} 	
		# ]

		Cell.group(:percent_complete).count
		# binding.pry
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
