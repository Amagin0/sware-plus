class CreateRecepiIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recepi_ingredients do |t|
      t.integer :recepi_id
      t.string :ingredient
      t.references :recepi, index: true

      t.timestamps
    end
  end
end
