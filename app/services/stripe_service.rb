# Class for moving stripe logic out of the controller
class StripeService
  def create_order(items)
    Stripe::Order.create(
      currency: 'usd',
      items: items.map do |item|
        {
          type: 'sku',
          parent: item.sku,
          quantity: item.quantity
        }
      end
    )
  end

  def pay_for_order(order, stripe_params)
    order.pay(
      source: stripe_params[:stripeToken],
      email: stripe_params[:stripeEmail]
    )
  end
end
