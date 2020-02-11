class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
  def new
    @portfolio = Portfolio.new
    # @portfolio.pfimage.new
  end
  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to root_path, notice: '投稿されました'
    else
      # @portfolios = @cook.portfolios.includes(:cook)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, :tecnic, :detale, :image1, :image2, :image3).merge(cook_id: current_cook.id)
    end
end
