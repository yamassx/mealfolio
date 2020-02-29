class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to cooks_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image).merge(cook_id: current_cook.id)

  end
end
