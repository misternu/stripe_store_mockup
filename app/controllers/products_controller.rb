class ProductsController < ApplicationController
  include CartHelper
  def index
    @products = Stripe::Product.list
    p @cart = current_cart
  end
end
