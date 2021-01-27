class AddUserToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user
    add_foreign_key :posts, :users
  end
end
