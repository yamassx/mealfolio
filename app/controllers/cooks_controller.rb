class CooksController < ApplicationController
  def index
   @portfolios = Portfolio.all
   @articles = Article.all
  end

  # def edit
  #   @cook = Cook.find(params[:id])
  # end

  # def update
  #   cook = Cook.find(params[:id])
  #   cook.update(cook_params)
  #   redirect_to cooks_path
  # end

  def show
    @cook = Cook.find(params[:id])
  end

  private

  def cook_params
    params.require(:cook).permit(:name, :email, :password, :password_confirmation, :greeting, :history, :face, :background )
  end

end
