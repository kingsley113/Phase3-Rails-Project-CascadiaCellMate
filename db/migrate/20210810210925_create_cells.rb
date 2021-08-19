class CreateCells < ActiveRecord::Migration[6.1]
  def change
    create_table :cells do |t|
      t.string :name
			t.text :description
			t.text :priority, default: "Low"
      t.integer :ck_coordinate_x
      t.integer :ck_coordinate_y
      t.integer :coordinate_x
      t.integer :coordinate_y
      t.integer :user_id
      t.integer :region_id
      t.integer :percent_complete, default: 0
      t.boolean :interior
      t.integer :exterior_cell_id
      t.string :color
			t.string :slug
      
      t.timestamps
    end
  end
end
