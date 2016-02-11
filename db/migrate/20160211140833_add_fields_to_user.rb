class AddFieldsToUser < ActiveRecord::Migration
  def up
    add_column :users, :sport, :string
    add_column :users, :where, :string
    add_column :users, :body, :string
    add_column :users, :up_size, :integer
    add_column :users, :down_size, :integer
    add_column :users, :foot_size, :integer
    add_column :users, :address, :text
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :zip, :string
  end
  def down
    remove_column :users, :sport
    remove_column :users, :where
    remove_column :users, :body
    remove_column :users, :up_size
    remove_column :users, :down_size
    remove_column :users, :foot_size
    remove_column :users, :address
    remove_column :users, :phone
    remove_column :users, :city
    remove_column :users, :country
    remove_column :users, :zip
    end
end
