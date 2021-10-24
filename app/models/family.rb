class Family < ApplicationRecord
#  accepts_nested_attributes_for :user
#  belongs_to と対にする
  validates :name, presence: true, length: { maximum: 50 }
  has_many :users
end
