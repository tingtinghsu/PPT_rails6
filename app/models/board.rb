class Board < ApplicationRecord
  validates :title, :intro, presence: true, length: {minimum: 2}
end
