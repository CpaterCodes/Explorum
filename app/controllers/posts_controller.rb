class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = posting_as_user?
    @post.save
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def posting_as_user?
    current_user ? current_user.posts.new(post_params) : Post.new(post_params)
  end

end
