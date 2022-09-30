class AddIndexToCard < ActiveRecord::Migration[7.0]
  def change
    add_index :cards, :card_number, unique: true
  end
end
