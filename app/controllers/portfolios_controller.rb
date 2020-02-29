class PortfoliosController < ApplicationController
  before_action :authenticate_cook!, except: [:index, :lp]
  # before_action :set_portfolio, only: [:edit]
  
  def lp
    render :layout => 'lp'
  end
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    image_sizing(250, 200)
    if @portfolio.save
      redirect_to cooks_path,
    else
      render :index
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    @portfolio.update(portfolio_params)
    redirect_to cooks_path
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    portfolio.destroy
    redirect_to cooks_path
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :tecnic, :detale, :image1).merge(cook_id: current_cook.id)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params [:id])
  end
      
  def image_sizing(width, height)
    if params[:image1] != nil
      img = MiniMagick::Pfimage.read(params[:image1])
      img.resize_to_fill 'width,height,"Center"'
      img.write "public/images/portfolio.jpg"
    end
  end
end
