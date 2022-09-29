json.extract! account, :id, :name, :phone_number, :date_of_birth, :sexe, :profession, :created_at, :updated_at
json.url account_url(account, format: :json)
