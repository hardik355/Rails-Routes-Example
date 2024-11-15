class CustomerAuthenticate
	extend ActiveSupport::Concern

	included do
		before_action :authenticate_customer!
	end

end 