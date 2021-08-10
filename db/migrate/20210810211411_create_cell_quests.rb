class CreateCellQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :cell_quests do |t|
      t.int :cell_id
      t.int :quest_id

      t.timestamps
    end
  end
end
