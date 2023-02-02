class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.includes(:author).where(posts_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(strong_params)
    @post.author = @user

    if @post.save
      flash[:success] = 'Post saved!'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = 'Please fill all fields'
      render :new, status: 422
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_path(current_user)
    flash[:success] = 'The post was successfully destroyed.'
  end

  # private

  def strong_params
    params.require(:post).permit(:title, :text)
  end
end
