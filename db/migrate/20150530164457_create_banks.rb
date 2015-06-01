class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :bank_key
      t.string :description

      t.timestamps null: false
    end
  end
end
