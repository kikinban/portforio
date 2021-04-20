
# todo モデル名・コントローラ名・テーブル名を変更（study records）
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/posts/index"
    else
      @post = Post.new(post_params)
      render "posts/new"
    end
  end

  private
  def post_params
    params.require(:post).permit(:time, :learning_plan, :learning_content, :it_took_time, :something_felt, :notices, :tomorrow)
  end

end
