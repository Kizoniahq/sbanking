class CreateDeposits < ActiveRecord::Migration[5.1]
  def change
    create_table :deposits do |t|
      t.string :type
      t.string :amount
      t.string :status
      t.string :depositors_name
      t.datetime :date
      t.integer :account_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
