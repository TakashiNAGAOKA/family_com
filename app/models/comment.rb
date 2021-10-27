class Comment < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 1000 }

  belongs_to :note
  belongs_to :user
end
