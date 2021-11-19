class EventOrdersController < ApplicationController
  #skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  def create_event_order
    if !current_user.cart.present?
      cart = current_user.build_cart
      cart.save
    else
      cart = current_user.cart
    end
    event_order = cart.event_orders.build(event_order_params)
    event_order.event = Event.find(params[:event][:event_id])
    event_order.save
    flash[:success] = "#{event_order.event.title} がカートに追加されました。"
    redirect_to carts_path(current_user)
  end

  def destroy_event_order
    event_order = EventOrder.find(params[:format])
    event_order.destroy
    flash[:success] = "#{event_order.event.title} がカートから削除されました。"
    redirect_to carts_path(current_user)
  end
  private
    def event_order_params
      params.permit(:event_id, :quantity, :paid_at, :payment_id, :adult_count, :child_count)
    end
end
