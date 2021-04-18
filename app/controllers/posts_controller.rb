class PostsController < ApplicationController
  def index
    @post = Post.all
  end
  def new
  end
  def create
    @post = Post.new(learning_content: params[:learning_content])
    @post.save
    redirect_to("/posts/index")
  end
end
