class PostsController < ApplicationController
  def index
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) 
    @post.save
  end 

  def show
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title).merge(user_id: params[:user_id].to_i)
  end 

end
