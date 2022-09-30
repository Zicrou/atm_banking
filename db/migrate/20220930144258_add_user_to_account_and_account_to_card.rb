class AddUserToAccountAndAccountToCard < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :user, foreign_key: true
    add_reference :cards, :account, foreign_key: true
  end
end
