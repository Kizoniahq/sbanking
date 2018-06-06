class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :account_number
      t.string :routine_number
      t.string :account_pin
      t.string :amount
      t.integer :user_id
      t.references :account, foreign_key: true
      t.string :otp
      t.string :tx_id
      t.string :transfer_type
      t.string :account_name

      t.timestamps
    end
  end
end
