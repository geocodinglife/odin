json.extract! payment, :id, :amount, :currency, :transaction_id, :reference, :room_id, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
