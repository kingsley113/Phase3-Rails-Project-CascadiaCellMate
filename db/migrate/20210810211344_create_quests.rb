class CreateQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :quests do |t|
      t.string :title
			t.string :summary
      t.text :details
      t.text :wiki_link
			t.string :slug
			t.string :category

      t.timestamps
    end
  end
end
