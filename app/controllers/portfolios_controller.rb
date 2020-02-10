class PortfoliosController < ApplicationController
  def index
    @portfolio = Portfolio.new
    @portfolios = Portfolio.all
  end
  def create
    @portfolio = @cook.portfolios.new(portfolio_params)
    if @portfolio.save
      redirect_to cook_portfolios_path(@group), notice: 'メッセージが送信されました'
    else
      @portfolios = @cook.portfolios.includes(:cook)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, :technic, :detale).merge(user_id: current_user.id)
    end
end
