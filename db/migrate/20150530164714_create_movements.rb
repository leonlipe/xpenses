class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.date :mov_date
      t.decimal :amount, precision: 9, scale: 2 
      t.string :note
      t.integer :category_id
      t.integer :bank_id

      t.timestamps null: false
    end
  end
end
