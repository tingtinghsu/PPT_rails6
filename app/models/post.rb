class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :serial, presence: true, uniqueness: true, allow_nil: true

  belongs_to :board, optional: true

  before_create :create_serial

  private
  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end
end
