class CommentsController < ApplicationController

  def index
    get_post
    @comments = @post.comments.all
  end

  def new
    get_post
    @comment = @post.comments.new
  end

  def create
    get_post
    @comment = @post.comments.build(comment_params)
    @comment.save
    redirect_to post_comments_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path(@comment.post)
  end
  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message, :user_id, :post_id)
  end

end
