class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_and_belongs_to_many :entities

  validates :name, presence: true
  validates :icon, presence: false
  validates :creator_id, presence: true
end
