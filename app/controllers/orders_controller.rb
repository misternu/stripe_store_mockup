class OrdersController < ApplicationController
  include CartHelper

  def new
    @sources = []
  end

  def create
    begin
      @order = Stripe::Order.create(
        currency: 'usd',
        items: current_cart.items.map { |item|
          {
            type: 'sku',
            parent: item.sku,
            quantity: item.quantity
          }
        }
      )
      p payment = @order.pay(
        source: stripe_params[:stripeToken],
        email: stripe_params[:stripeEmail]
      )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      return redirect_to '/checkout'
    end
    new_cart
    redirect_to '/products'
  end

  private

  def stripe_params
    params.permit(:stripeToken, :stripeEmail)
  end
end
