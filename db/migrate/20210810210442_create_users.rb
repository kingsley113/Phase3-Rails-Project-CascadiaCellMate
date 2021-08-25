class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :display_name
      t.string :password_digest
      t.string :discord_id
			t.string :accent_color
			t.string :slug
			t.text :recent_cells
			t.text :uid
			t.text :image

      t.timestamps
    end
  end
end
