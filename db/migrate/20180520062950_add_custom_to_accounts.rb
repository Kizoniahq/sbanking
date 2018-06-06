class AddCustomToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :confirmed, :boolean
    add_column :accounts, :phone_number, :string
  end
end
