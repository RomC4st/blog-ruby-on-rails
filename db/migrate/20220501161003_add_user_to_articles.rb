class AddUserToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :user, foreign_key: true ,default: 1
  end
end
