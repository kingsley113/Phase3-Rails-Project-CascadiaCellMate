class CreateCells < ActiveRecord::Migration[6.1]
  def change
    create_table :cells do |t|
      t.string :name
      t.integer :ck_coordinate_x
      t.integer :ck_coordinate_y
      t.integer :coordinate_x
      t.integer :coordinate_y
      t.integer :user_id
      t.text :description
      t.integer :region_id
      t.integer :percent_complete
      t.boolean :interior
      t.integer :exterior_cell_id
      t.text :color
      t.integer :priority

      t.timestamps
    end
  end
end
