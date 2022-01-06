class CreateRecepiComments < ActiveRecord::Migration[5.2]
  def change
    create_table :recepi_comments do |t|
      t.integer :customer_id
      t.integer :recepi_id
      t.text :comment
      t.timestamps
    end
  end
end
