class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :serial, presence: true, uniqueness: true, allow_nil: true

  belongs_to :board, optional: true
  belongs_to :user
  has_many :comments
  
  before_create :create_serial

  def display_author
    if user.nil?
      "-"
    else
      user.account
    end
  end

  private
  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end
end
