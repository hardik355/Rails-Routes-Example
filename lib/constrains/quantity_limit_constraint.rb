class QuantityLimitConstraint
  def initialize
    @max_quantity = 10  # Max 10 items per order
  end

  def matches?(request)
    items = request.params[:order][:items]
    
    # Calculate the total quantity of items in the order
    total_quantity = items.sum { |item| item[:quantity].to_i }

    if total_quantity > @max_quantity
      # Block if total quantity exceeds the limit
      false
    else
      # Allow the request if under the limit
      true
    end
  end
end
