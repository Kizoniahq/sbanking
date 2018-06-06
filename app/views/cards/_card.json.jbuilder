json.extract! card, :id, :type, :pin, :veriy_pin, :card_number, :cvv, :expiry, :card_name, :account_id, :user_id, :created_at, :updated_at
json.url card_url(card, format: :json)
