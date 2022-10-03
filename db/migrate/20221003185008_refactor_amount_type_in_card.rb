class RefactorAmountTypeInCard < ActiveRecord::Migration[7.0]
  def change
    remove_column :cards, :amount, :decimal
    add_column :cards, :amount, :decimal, :precision => 19, :scale => 2
  end
end
