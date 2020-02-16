class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:index, :edit, :update, :destroy]
  def index
    @portfolios = Portfolio.all
    # render template: "cooks/index"
  end
  def new
    @portfolio = Portfolio.new
  end
  def create
    @portfolio = Portfolio.new(portfolio_params)
    if params[:image1] != nil
      img = MiniMagick::Pfimage.read(params[:image1])
      img.resize_to_fill '250,200,"Center"'
      img.write "public/images/portfolio.jpg"
    end
    if @portfolio.save
      redirect_to root_path, notice: '投稿されました'
    else
      # @portfolios = @cook.portfolios.includes(:cook)
      flash.now[:alert] = '保存ができませんでした'
      render :index
    end
  end
  def edit
  end
  def update
    @portfolio.update(portfolio_params)
  end

  def destroy
    portfolio.destroy
    redirect_to "#"
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, :tecnic, :detale, :image1, :image2, :image3).merge(cook_id: current_cook.id)
    end

    def set_portfolio
      @portfolio = Portfolio.find(params [:id])
    end
end
