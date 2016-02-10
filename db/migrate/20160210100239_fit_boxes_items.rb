class FitBoxesItems < ActiveRecord::Migration
  def change
    create_table :fit_boxes_items, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :fit_box, index: true
    end  
  end
end
