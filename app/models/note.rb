class Note < ApplicationRecord
  validates :subject_id, presence: true, length: { maximum: 20 }
  validates :status, presence: true, length: { maximum: 255 }
  validates :note, presence: false, length: { maximum: 255 }

  belongs_to :subject
  belongs_to :user
  has_many :comments
  
end
