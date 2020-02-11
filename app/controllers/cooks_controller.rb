class CooksController < ApplicationController
  def index
   @portfolios = Portfolio.all
  end
end
