
# todo モデル名・コントローラ名・テーブル名を変更（study records）
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find_by(id: params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path(post_params)
    else
      @post = Post.new(post_params)
      render "posts/new"
    end
  end
  def months
    year = params[:year].to_s
    month = params[:month].to_s
    year_month = year + "/" + month
    @posts = Post.where(date: Time.parse(year_month).beginning_of_week..Time.parse(year_month).end_of_month)
  end


  private
  def post_params
    params.require(:post).permit(:date, :time, :learning_plan, :learning_content, :understandable, :it_took_time, :something_felt, :notices, :tomorrow)
  end
end
