# Class for dealing with the addresses of a User
class AddressesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.addresses.create(address_params)
    redirect_to '/checkout'
  end

  private

  def address_params
    params.require(:address).permit(
      :user,
      :name,
      :line1,
      :line2,
      :city,
      :postal_code,
      :state,
      :country,
      :phone
    )
  end
end
