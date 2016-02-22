class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_reference :article, :user, index: true
    add_foreign_key :article, :users
  end
end
