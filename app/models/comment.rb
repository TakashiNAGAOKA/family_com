class Comment < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 255 }

  belongs_to :note
  belongs_to :user
end
