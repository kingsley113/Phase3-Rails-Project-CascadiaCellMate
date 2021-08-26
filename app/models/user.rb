class User < ApplicationRecord
	# Relationships
	has_many :cells
	has_many :comments
	has_many :cells, through: :comments

	# Enable Bcrypt password
	has_secure_password

	# Validations
	validates :username, :password, presence: true, on: [:create]
	validates :username, :slug, uniqueness: true
	# validates :access_code, inclusion: {in: %w(doeshesmelllikegluten), message: 'is incorrect'}, on: :create
	
	# callbacks
	before_create :set_default_display_name
	after_validation :set_slug, only: [:create, :update]

	# instance methods
	def to_param
		self.slug
	end

	def set_recent_cell(cell)
		# get array of recent visits
		visits = self.recent_cells
		# add cell id to array of recents
		if visits
			visits = visits.split(",")
			if visits.include?(cell.id.to_s)
				visits.delete(cell.id.to_s)
				visits.unshift(cell.id)
			else
				visits.unshift(cell.id)
				# if array is greater than x in length, delete the last entry
				if visits.length > 6
					visits.pop
				end
			end
			if visits.length > 1
				self.recent_cells = visits.join(",")
			end
		else
			self.recent_cells = cell.id	
		end
		self.save
	end

	def get_recent_cells
		Cell.find(self.recent_cells.split(","))
	end

	def random_password
		chars = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
		self.password = chars.sort_by { rand }.join[0...16]
	end

	private

	def set_default_display_name
		if self.display_name.nil?
			self.display_name = self.username
		end
	end

	def set_slug
		self.slug = self.username.parameterize
	end

end
