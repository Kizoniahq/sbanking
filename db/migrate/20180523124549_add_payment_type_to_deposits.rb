class AddPaymentTypeToDeposits < ActiveRecord::Migration[5.1]
  def change
    add_column :deposits, :payment_method, :string
  end
end
