class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  def top
    if current_user && !current_user.cart.present?
      cart = current_user.build_cart
      cart.save
    end
  end
end
