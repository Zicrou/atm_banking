class AddAddressToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :address, :string
  end
end
