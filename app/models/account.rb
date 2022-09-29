class Account < ApplicationRecord
  enum :sexe, [:man, :woman]
  #enum :status, [:pending, :activated, :disable]
end
