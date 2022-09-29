class Account < ApplicationRecord
  enum :sexe, [:man, :woman]
  #enum :status, [:in_progress, :activated, :disable]
end
