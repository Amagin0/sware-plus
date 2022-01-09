class CreateRecepiRaties < ActiveRecord::Migration[5.2]
  def change
    create_table :recepi_raties do |t|
      t.float :recepi_taste
      t.float :recepi_fun
      t.integer :customer_id
      t.integer :recepi_id
      t.timestamps
    end
  end
end
