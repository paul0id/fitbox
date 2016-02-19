class AddStatusToFitBoxes < ActiveRecord::Migration
  def up
    add_column :fit_boxes, :status, :integer
  end

  def down
    remove_column :fit_boxes, :status
  end
end
