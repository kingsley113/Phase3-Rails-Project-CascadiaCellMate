class CreateQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :quests do |t|
      t.string :name
      t.text :description
      t.text :wiki_link

      t.timestamps
    end
  end
end
