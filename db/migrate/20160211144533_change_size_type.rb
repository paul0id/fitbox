class ChangeSizeType < ActiveRecord::Migration
  def up
    remove_column :users, :foot_size
    remove_column :users, :up_size
    remove_column :users, :down_size
    add_column :users, :foot_size, :string
    add_column :users, :up_size, :string
    add_column :users, :down_size, :string

  end

  def down
    remove_column :users, :foot_size
    remove_column :users, :up_size
    remove_column :users, :down_size
    add_column :users, :foot_size, :integer
    add_column :users, :up_size, :integer
    add_column :users, :down_size, :integer
  end
end
