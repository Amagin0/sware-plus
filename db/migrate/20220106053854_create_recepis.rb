class CreateRecepis < ActiveRecord::Migration[5.2]
  def change
    create_table :recepis do |t|
      t.string :customer_id
      t.string :recepi_title
      t.string :recepi_image_id, null: false
      t.integer :impressions_count
      t.timestamps
    end
  end
end
