class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end
  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
  end
  
  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
