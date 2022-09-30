class Card < ApplicationRecord
  enum :sexe, [:debit, :credit]
  belongs_to :account #, class_name: "account", foreign_key: "account_id"

  validates_presence_of :account_id, :card_number, :expiration_date, :card_type, :amount

end
