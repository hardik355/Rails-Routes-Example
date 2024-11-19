class SuspiciousEmailConstraint
  def initialize
    @suspicious_domains = ['fakeemail.com', 'spammydomain.net', 'yopmail.com', 'test@yopmail.com']
  end 

  def matches?(request)
    email = request.params.dig(:order, :email)
    return false if email.blank?
    domain = email.split('@').last
    is_suspicious = @suspicious_domains.include?(domain)
    Rails.logger.info "Email: #{email}, Domain: #{domain}, Suspicious: #{is_suspicious}"
    !is_suspicious
  end 

end