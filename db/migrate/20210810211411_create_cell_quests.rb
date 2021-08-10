class CreateCellQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :cell_quests do |t|
      t.integer :cell_id
      t.integer :quest_id

      t.timestamps
    end
  end
end
