class RemoveBankIdFromMovements < ActiveRecord::Migration
  def change
		remove_column :movements, :bank_id
  end
end
