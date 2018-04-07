# Controller for creating and paying for orders
class OrdersController < ApplicationController
  before_action :authenticate_user!

  include CartHelper

  def new
    @sources = []
    @addresses = current_user.addresses
    @address = Address.new
  end

  def create
    begin
      stripe = StripeService.new
      order = stripe.create_order(current_cart.items)
      stripe.pay_for_order(order, stripe_params)
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
