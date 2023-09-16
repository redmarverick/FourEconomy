class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, foreign_key: 'creator_id', dependent: :destroy

  has_many :entities, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true

  def admin?
    self.admin == true
  end
end
