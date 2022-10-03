class Transaction < ApplicationRecord
  #enum :transaction_type, { balance: 0, deposit: 1, withdraw: 2 } #[:balance, :deposit, :withdraw]
  validates :amount, presence: true #, uniqueness: { case_sensitive: false }, length: {maximum: 50}, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?
  
  
end
