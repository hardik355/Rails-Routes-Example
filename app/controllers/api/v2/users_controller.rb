class Api::V2::UsersController < ApplicationController

  def index
    users = User.all
    render json: {new_v2: 'V2 NEW CUSTOMER', users: users}
  end

  def old_customer
    users = User.all
    render json: {new_v2: 'V2 OLD CUSTOMER', users: users}
  end

end
