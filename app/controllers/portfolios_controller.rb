class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
  def new
    @portfolio = Portfolio.new
    # @portfolio.pfimage.new
  end
  def create
    @portfolio = Portfolio.create(portfolio_params)
    # if @portfolio.save
    #   redirect_to cook_portfolios_path(@group), notice: 'メッセージが送信されました'
    # else
    #   @portfolios = @cook.portfolios.includes(:cook)
    #   flash.now[:alert] = 'メッセージを入力してください。'
    #   render :index
    # end
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, :technic, :detale, images_attributes: [:image, :_destroy, :id]).merge(cook_id: current_cook.id)
    end
end
