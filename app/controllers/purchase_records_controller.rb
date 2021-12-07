class PurchaseRecordsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @payments = Payment.all.order(created_at: "DESC")
  end

  def show
    @payment = Payment.find(params[:id])
  end
end
