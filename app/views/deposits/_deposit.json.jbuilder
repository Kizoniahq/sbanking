json.extract! deposit, :id, :type, :amount, :status, :depositors_name, :date, :account_id, :user_id, :created_at, :updated_at
json.url deposit_url(deposit, format: :json)
