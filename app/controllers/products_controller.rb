class ProductsController < ApplicationController
  include CartHelper
  def index
    begin
      @products = Stripe::Product.list
    rescue Stripe::APIConnectionError
      @products = []
      flash[:alert] = "Stripe could not connect"
    end
  end
end
