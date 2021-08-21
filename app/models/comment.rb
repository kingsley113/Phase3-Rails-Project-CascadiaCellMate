class Comment < ApplicationRecord
	# Relationships
	belongs_to :user
	belongs_to :cell

	# Validations
	validates :content, :user_id, :cell_id, presence: true

def comment_time
	self.created_at.strftime("%F %r")
end

end
