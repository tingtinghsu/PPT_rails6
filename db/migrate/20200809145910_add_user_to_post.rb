class AddUserToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true, default: 6
  end
end
