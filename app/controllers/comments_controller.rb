class CommentsController < ApplicationController
  before_action :get_post

  def index
    @comments = @post.comments.all
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.save
    redirect_to post_comments_path(@post)
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message, :user_id, :post_id)
  end

end
