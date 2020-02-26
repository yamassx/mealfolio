class CooksController < ApplicationController
  def index
   @portfolios = Portfolio.all
  end

  def edit
    @cook = Cook.find(params[:id])
  end

  def update

  end

  private

  def cook_params
    params.require(:cook).permit(:name, :email, :password, :password_confirmation, :greeting, :history, :face, :background )
  end
end
