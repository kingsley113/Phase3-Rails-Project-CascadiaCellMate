class Quest < ApplicationRecord
	# Relationships
	has_many :cell_quests
	has_many :cells, through: :cell_quests 

	# Validations
	validates :title, presence: true
	validates :title, :slug, uniqueness: true

	# Callbacks
	after_validation :set_slug, only: [:create, :update]

	def to_param
		self.slug
	end

	def self.all_by_title
		@quests = Quest.all.sort_by{ |quest| quest.title}
	end

	private

	def set_slug
		self.slug = self.title.parameterize
	end

end
