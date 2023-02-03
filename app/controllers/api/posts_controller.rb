class Api::PostsController < ApplicationController
  # before_action :authenticate_user!
  respond_to :json

  def index
    # @posts = current_user.posts
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts
    render json: { posts: @posts }, status: :ok
  end
end
