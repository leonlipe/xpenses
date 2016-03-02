class AddAliasToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :alias, :string
  end
end
