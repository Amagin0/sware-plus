class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :tag_id
      t.string :genre_name
      t.timestamps
    end
  end
end
