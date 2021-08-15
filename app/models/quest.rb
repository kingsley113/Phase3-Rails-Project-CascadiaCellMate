class Quest < ApplicationRecord
	# Relationships
	has_many :cell_quests
	has_many :cells, through: :cell_quests 

	# Validations
	validates :name, presence: true
	validates :name, :slug, uniqueness: true

	# Callbacks
	after_validation :set_slug, only: [:create, :update]

	def to_param
		self.slug
	end

	private

	def set_slug
		self.slug = self.name.parameterize
	end

end
