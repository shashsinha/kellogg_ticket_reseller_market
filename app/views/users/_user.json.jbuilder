json.extract! user, :id, :first_name, :last_name, :email_address, :credit_card_number, :credit_card_zip_code, :credit_card_expiration, :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt