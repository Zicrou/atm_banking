class ChangeAmountTypeInCard < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :amount, :decimal
  end
end
