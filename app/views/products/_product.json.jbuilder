json.extract! product, :id, :name, :price, :compare_at, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
