class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :kind
      t.string :upc
      t.string :color
      t.string :size

      t.timestamps null: false
    end
  end
end
