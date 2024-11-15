class ApiVersionConstraint
  
  def initialize(version)
    @version = version
    Rails.logger.info("# STEP 1 CHECK API VERSION IS ==> #{@version}")
  end
  
  def matches?(request)
    Rails.logger.info("# STEP 2 API REQUEST PATH ==> #{request.path}")
    version_match = request.path.start_with?("/api/#{@version}")
    device_type_match = !(request.user_agent =~ /Mobile|Android|iPhone|iPad|BlackBerry|Windows Phone/i)
    Rails.logger.info("MOBILE OR DEVICE => #{request.user_agent}")
    version_match && device_type_match
  end 

end 