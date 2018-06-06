class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.datetime :dob
      t.string :image
      t.string :mother_name
      t.references :user, foreign_key: true
      t.string :slug
      t.string :account_number
      t.string :routine_number
      t.string :account_pin
      t.string :account_balance

      t.timestamps
    end
    add_index :accounts, :slug
  end
end
