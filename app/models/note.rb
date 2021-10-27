class Note < ApplicationRecord
  validates :subject_id, presence: true, length: { maximum: 10 }
  validates :status, presence: true, length: { maximum: 50 }
  validates :note, presence: true, length: { maximum: 1000 }

  belongs_to :subject
  belongs_to :user
  has_many :comments
  
end
