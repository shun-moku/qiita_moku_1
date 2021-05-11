class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
  end

  def destroy
    article = article.find(params[:id])
    article.destroy
  end


  private
  def article_params
    params.require(:article).permit(:name, :image, :text)
  end

end
