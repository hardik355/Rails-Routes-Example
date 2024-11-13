module CustomerAuthenticate
	extend ActiveSupport::Concern

	included do
		p 111111111111111111111111111111
		before_action :authenticate_customer!
	end

end 