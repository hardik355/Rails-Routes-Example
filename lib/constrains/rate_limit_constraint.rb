class RateLimitConstraint
  def initialize
    @limit = 3
    @time_frame = 5.minutes
  end

  def matches?(request)
    ip = request.remote_ip
    recent_orders = Order.where(ip_address: ip)
                          .where('created_at > ?', Time.now - @time_frame).count
    Rails.logger.info("IP: #{ip}, Recent Orders: #{recent_orders}, Limit: #{@limit}, Allowed: #{recent_orders < @limit}")                      
    recent_orders < @limit
  end
end