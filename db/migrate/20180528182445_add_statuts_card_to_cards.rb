class AddStatutsCardToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :status, :boolean
  end
end
