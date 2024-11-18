class SuspiciousEmailConstraint
  def initialize
    @suspicious_domains = ['fakeemail.com', 'spammydomain.net', 'yopmail.com']
  end 

  def matches?(request)
    email = request.params[:order][:email]
    domain = email.split('@').last if email
    is_suspicious = @suspicious_domains.include?(domain)
    request.env['suspicious_email'] = is_suspicious
    !is_suspicious
  end 

end