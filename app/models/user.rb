class User < ApplicationRecord
	# Relationships
	has_many :cells
	has_many :comments

	# Enable Bcrypt password
	has_secure_password

	# Validations
	validates :username, :password, presence: true, on: :create
	validates :username, :slug, uniqueness: true
	
	# callbacks
	before_create :set_default_display_name
	after_validation :set_slug, only: [:create, :update]
	
	def to_param
		self.slug
	end

	def set_recent_cell(cell)
		# get array of recent visits
		visits = current_user.recent_cells.split[0]
		# add cell id to array of recents
		visits.unshift(cell.id)
		# if array is greater than x in length, delete the last entry
		if visits.length > 6
			visits.pop
		end
		current_user.recent_cells = visits
		current_user.save
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
