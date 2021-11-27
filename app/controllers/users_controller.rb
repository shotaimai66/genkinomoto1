class UsersController < ApplicationController
  # indexとshowはスタッフのみのログインで可能
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
  end

  def account
    @users = User.where(id: current_user.id)
    # @reservations = Reservation.find_by(guest_id: current_user.id)
    @reservations = Reservation.all.includes(:guest)
    @staffs = Staff.all
  end

  def out
    user = current_user
    if user.update(flag: true, exit_date: Time.now)
      reset_session # データをリセットする
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    end
  end
end
