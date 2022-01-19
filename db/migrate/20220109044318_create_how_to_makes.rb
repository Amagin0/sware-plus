class CreateHowToMakes < ActiveRecord::Migration[5.2]
  def change
    create_table :how_to_makes do |t|
      t.integer :recepi_id
      t.text :recepi_make
      t.string :how_to_image_id
      t.references :recepi, index: true

      t.timestamps
    end
  end
end
