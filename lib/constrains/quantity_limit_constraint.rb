class QuantityLimitConstraint
  def initialize
    @max_quantity = 10
  end

  def matches?(request)
    total_quantity = request.params["order"]["items"].to_i
    total_quantity < @max_quantity
  end
end
