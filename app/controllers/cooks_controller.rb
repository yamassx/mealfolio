class CooksController < ApplicationController
  def index
    @cook = Cook.new
  end
end
