class AddKindToMovement < ActiveRecord::Migration
  def change
    add_column :movements, :kind, :integer
  end
end
