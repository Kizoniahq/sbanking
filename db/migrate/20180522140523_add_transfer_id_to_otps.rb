class AddTransferIdToOtps < ActiveRecord::Migration[5.1]
  def change
    add_column :otps, :transfer_id, :integer
  end
end
