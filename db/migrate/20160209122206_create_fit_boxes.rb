class CreateFitBoxes < ActiveRecord::Migration
  def change
    create_table :fit_boxes do |t|
      t.string :name
      t.text :description
      t.integer :manager_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
