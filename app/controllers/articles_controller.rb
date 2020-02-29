class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  private

  def article_params
    params.require(:article).merge(cook_id: current_cook.id)
  end
end
