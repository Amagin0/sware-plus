class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :recepi_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
