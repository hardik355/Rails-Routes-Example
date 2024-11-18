json.extract! order, :id, :email, :items, :ip_address, :created_at, :updated_at
json.url order_url(order, format: :json)
