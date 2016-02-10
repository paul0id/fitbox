class AddPicturesToUsersAndItems < ActiveRecord::Migration
  def up
    add_column :users, :avatar, :string
    add_column :items, :picture, :string
  end
  def down
    remove_column :users, :avatar
    remove_column :items, :picture
  end
end
