module CartHelper
  def current_cart
    return new_cart unless session[:cart_id]
    Cart.find(session[:cart_id]) || new_cart
  end

  def new_cart
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
