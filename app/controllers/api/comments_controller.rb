class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  respond_to :json

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: { comments: @comments }, status: :ok
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      render json: { message: 'successfully created' }, status: :created
    else
      render json: { errors: @comment.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
