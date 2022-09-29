class Account < ApplicationRecord
  enum :sexe, [:man, :woman]
end
