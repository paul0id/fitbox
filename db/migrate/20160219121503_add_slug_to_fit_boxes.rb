class AddSlugToFitBoxes < ActiveRecord::Migration
  def change
    add_column :fit_boxes, :slug, :string
    add_index :fit_boxes, :slug
  end
end
