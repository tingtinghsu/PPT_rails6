class Board < ApplicationRecord
  acts_as_paranoid
  validates :title, :intro, presence: true, length: {minimum: 2}

  has_many :posts
end
