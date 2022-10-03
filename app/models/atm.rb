class Atm < ApplicationRecord
  enum :transaction_type, { balance: 0, deposit: 1, withdraw: 2 } #[:balance, :deposit, :withdraw]

  
end
