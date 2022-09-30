class Card < ApplicationRecord
  enum :sexe, [:debit, :credit]
  belongs_to :account #, class_name: "account", foreign_key: "account_id"

  validates_presence_of :account_id, :expiration_date, :card_type, :amount
  validates :card_number, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 8}
  

  def update_money(card, amount)
    Card.where(id: card).update!(amount: amount)
  end
  
  
end
