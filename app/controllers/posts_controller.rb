class PostsController < ApplicationController
  def new
  end

  def create
    redirect_to posts_path
  end

  def index
  end

end
