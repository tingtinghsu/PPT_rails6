class Board < ApplicationRecord
  validates :title, :intro, presence: true, length: {minimum: 2}
  def destroy
    update(deleted_at: Time.now)
  end
end
