class CreateOtps < ActiveRecord::Migration[5.1]
  def change
    create_table :otps do |t|
      t.string :otp
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end
