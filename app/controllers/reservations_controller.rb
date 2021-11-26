class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!
  # only: [:index, :new, :create, :show] ←ユーザーは閲覧可能
  skip_before_action :authenticate_staff!, only: [:index, :new, :create, :show]
  def index
    @reservations = Reservation.all.includes(:guest)
  end


  def confirm_reservation
    @reservations_on_request = Reservation.on_request.from_today.includes(:guest)
    @reservations_on_reserve = Reservation.on_reserve.from_today.includes(:guest)
    @reservations = Reservation.all.includes(:guest)
    respond_to do |format|
      format.html
      format.json { @reservations }
    end
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.apply!
    if @reservation.save
      user = User.find(@reservation.guest_id)
      #申込したゲストへのメール
      # UserMailer.request_reservation(user, @reservation).deliver_now
      #スタッフへのメール
      # UserMailer.request_reservation_staff(user, @reservation).deliver_now
      redirect_to reservations_path, notice: "お客様の仮予約が完了しました。承認されるまでお待ちください。"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    title_for_staff_comment = "予約確定 #{@reservation.guest.name}様 #{@reservation.course_i18n}"
    @reservation.update(status: :on_reserve, title_for_guest: "予約確定", title_for_staff: title_for_staff_comment)
    user = User.find(@reservation.guest_id)
    #ゲストへの予約確定メール
    # UserMailer.reservation_confirm(user, @reservation).deliver_now
    redirect_to confirm_reservation_reservations_url, notice: "予約確定をしました。"
  end

  def edit_reserve
    @reservation = Reservation.find(params[:id])
  end

  def update_reserve
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      @reservation.apply_reserve!
      redirect_to confirm_reservation_reservations_url, notice: "予約を編集しました。"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to confirm_reservation_reservations_url, notice: "予約を削除しました。"
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_time, :course, :comment, :reservation_time, :guest_id)
  end
end
