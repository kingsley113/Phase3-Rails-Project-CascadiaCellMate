class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.integer :cell_id
			t.string :name

      t.timestamps
    end
  end
end
