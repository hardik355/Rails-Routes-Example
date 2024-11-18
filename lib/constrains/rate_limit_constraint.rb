class RateLimitConstraint
  def initialize
    @limit = 3  # Max 3 orders in 5 minutes
    @time_frame = 5.minutes
  end

  def matches?(request)
    ip = request.remote_ip
    recent_orders = Order.where(ip_address: ip)
                          .where('created_at > ?', Time.now - @time_frame)
                          .count

    if recent_orders >= @limit
      # Block if more than 3 orders from the same IP in the last 5 minutes
      false
    else
      # Allow the request if under the limit
      true
    end
  end
end
