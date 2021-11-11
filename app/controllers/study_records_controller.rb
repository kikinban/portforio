
class StudyRecordsController < ApplicationController
  # 学習記録一覧
  def index
    @posts = StudyRecord.all
  end

  # 記録詳細
  def show
    @post = StudyRecord.find_by(id: params[:id])
  end

  # 新規記録
  def new
    @post = StudyRecord.new
  end

  # 記録を保存する
  def create
    @post = StudyRecord.new(post_params)
    if @post.save
      redirect_to study_records_index_path(@post)
    else
      @post = StudyRecord.new(post_params)
      render "posts/new"
    end
  end

  # 月ごとに記録を表示
  def months
    year = params[:year].to_s
    month = params[:month].to_s
    year_month = year + "/" + month
    @posts = StudyRecord.where(date: Time.parse(year_month).beginning_of_month..Time.parse(year_month).end_of_month)
  end

  # 編集
  def edit 
    @post = StudyRecord.find_by(id: params[:id])
  end

  # 更新
  def update
    @post = StudyRecord.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = "変更した記録が保存されました"
      redirect_to study_records_index_path(post_params)
    else
      render "posts/edit"
    end
  end

  # 削除
  def destroy
    @post = StudyRecord.find_by(id: params[:id])
    @post.id == params[:id]
    @post.destroy
    flash[:notice] = "記録を削除しました"
    redirect_to "/posts/index"
  end
  
  # ストロングパラメータ
  private
  def post_params
    params.require(:study_record).permit(:date, :time, :minute, :learning_plan, :learning_content, :understandable, :it_took_time, :something_felt, :notices, :tomorrow)
  end

end
