class Api::V1::BlogsController < ApplicationController

  def index
    blogs = Blog.all
    render json: {blogs: blogs}
  end

end
