class Card < ApplicationRecord
  enum :sexe, [:debit, :credit]
end
