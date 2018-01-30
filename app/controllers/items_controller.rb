class ItemsController < ApplicationController
  include CartHelper
  def create
    cart = current_cart
    if cart.items.any? { |item| item.sku == item_params[:sku] }
      item = cart.items.find_by(sku: item_params[:sku])
      item.increment!(:quantity)
    else
      cart.items.create(item_params)
    end
    redirect_to products_path
  end

  private

  def item_params
    params.require(:item).permit(:sku, :name, :quantity)
  end
end
