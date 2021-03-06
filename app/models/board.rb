class Board < ApplicationRecord
  acts_as_paranoid
  validates :title, :intro, presence: true, length: {minimum: 2}

  has_many :posts

  has_many :board_masters
  has_many :users, through: :board_masters

  def favorited_by?(u)
    favorited_users.include?(u)
  end
end
