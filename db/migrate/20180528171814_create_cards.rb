class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :card_type
      t.string :pin
      t.string :veriy_pin
      t.string :card_number
      t.string :cvv
      t.datetime :expiry
      t.string :card_name
      t.integer :account_id
      t.integer :user_id

      t.timestamps
    end
  end
end
