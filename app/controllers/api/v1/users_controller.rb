class Api::V1::UsersController < ApplicationController

  def index_v1
    users = User.all
    render json: {new_v1: 'V1 NEW CUSTOMER', users: users}
  end 


  def old_customer
    users = User.all
    render json: {new_v1: 'V1 OLD CUSTOMER', users: users}
  end 
end
