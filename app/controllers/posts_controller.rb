class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user ? current_user.posts.create(post_params) : Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
