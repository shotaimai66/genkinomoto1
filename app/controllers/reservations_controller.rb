class ReservationsController < ApplicationController
  #ログイン済みユーザーは{index,show,new,create}アクションのみアクセスできる
  skip_before_action :authenticate_user!
  #スタッフは全てのアクションにアクセスできる
  skip_before_action :authenticate_staff!, only: [:index, :show, :new, :create]
  before_action :set_reservations, only: [:index, :confirm_reservation, :management_new]
  before_action :set_reservation, only: [:show, :edit, :update, :edit_reserve, :update_reserve, :destroy]
  before_action :set_menus, only: [:new, :edit_reserve, :management_new]
  before_action :set_users, only: :management_new
  # :end_timeが現在時刻を過ぎているデータは:statusをcompleted(施術完了)にする
  before_action :reservation_completed, only: [:index, :confirm_reservation]
  before_action :set_q, only: [:reservation_management, :search]
  before_action :set_new, only: [:management_new, :new]

  def reservation_management
    @search_reservations = @q.result
  end

  def search
    @search_reservations = @q.result
  end

  def management_new
  end

  def reservation_management_create
    @reservation = Reservation.new(reservation_params)
    menu = Menu.find_by(course_number: reservation_params[:course])
    if menu.present?
      # end_time登録の為に使用。30分以下は10分、31分以上の施術時間はインターバルタイムを20分追加した時間でend_timeを登録
      if menu.treatment_time <= 30
        menu_time = 60 * (menu.treatment_time + 10)
      else
        menu_time = 60 * (menu.treatment_time + 20)
      end
      @reservation.treatment_menu = menu.title
      @reservation.treatment_time_menu = menu.treatment_time
      @reservation.charge_menu = menu.charge
      @reservation.apply_management!(menu_time)
    end
    if @reservation.save
      user = User.find(@reservation.guest_id)
      #申込したゲストへのメール
      # UserMailer.request_reservation(user, @reservation).deliver_now
      #スタッフへのメール
      # UserMailer.request_reservation_staff(user, @reservation).deliver_now
      redirect_to reservation_management_reservations_url, notice: "お客様の仮予約が完了しました。承認されるまでお待ちください。"
    end
  end

  def index
  end

  def confirm_reservation
    @reservations_on_request = Reservation.on_request.from_today.includes(:guest)
    @reservations_on_reserve = Reservation.on_reserve.from_today.includes(:guest)
    respond_to do |format|
      format.html
      format.json { @reservations }
    end
  end

  def show
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    menu = Menu.find_by(course_number: reservation_params[:course])
    if menu.present?
      # end_time登録の為に使用。30分以下は10分、31分以上の施術時間はインターバルタイムを20分追加した時間でend_timeを登録
      if menu.treatment_time <= 30
        menu_time = 60 * (menu.treatment_time + 10)
      else
        menu_time = 60 * (menu.treatment_time + 20)
      end
      @reservation.treatment_menu = menu.title
      @reservation.treatment_time_menu = menu.treatment_time
      @reservation.charge_menu = menu.charge
      @reservation.apply!(menu_time)
    end
    if @reservation.save
      user = User.find(@reservation.guest_id)
      #申込したゲストへのメール
      # UserMailer.request_reservation(user, @reservation).deliver_now
      #スタッフへのメール
      # UserMailer.request_reservation_staff(user, @reservation).deliver_now
      redirect_to reservations_url, notice: "お客様の仮予約が完了しました。承認されるまでお待ちください。"
    end
  end

  def edit
  end

  def update
    title_for_staff_comment = "予約確定 #{@reservation.guest.name}様 #{@reservation.treatment_menu}"
    @reservation.update(status: :on_reserve, title_for_guest: "予約確定", title_for_staff: title_for_staff_comment)
    user = User.find(@reservation.guest_id)
    #ゲストへの予約確定メール
    # UserMailer.reservation_confirm(user, @reservation).deliver_now
    redirect_to confirm_reservation_reservations_url, notice: "予約確定をしました。"
  end

  def edit_reserve
  end

  def update_reserve
    if @reservation.update(reservation_params)
      menu = Menu.find_by(course_number: reservation_params[:course])
      if menu.present?
        if menu.treatment_time <= 30
          menu_time = 60 * (menu.treatment_time + 10)
        else
          menu_time = 60 * (menu.treatment_time + 20)
        end
        @reservation.treatment_menu = menu.title
        @reservation.treatment_time_menu = menu.treatment_time
        @reservation.charge_menu = menu.charge
        @reservation.apply_update!(menu_time)
      end
      redirect_to confirm_reservation_reservations_url, notice: "予約を編集しました。"
    end
  end

  def destroy
    # cancel_flagを1にする事で論理削除実施 & ステータスを3(completed施術完了)に切り替え
    @reservation.update(cancel_flag: 1, status: :completed)
    redirect_to confirm_reservation_reservations_url, notice: "予約を削除しました。"
  end

  private

    def reservation_params
      params.require(:reservation).permit(:start_time, :course, :comment, :status, :cancel_flag, :reservation_time, :guest_id, :store_id)
    end

    def set_reservations
      @reservations = Reservation.includes(:guest)
    end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def set_menus
      @menus = Menu.all
    end

    
    def set_users
      @users = User.all
    end

    def reservation_completed
      now = Time.current
      reservations = Reservation.where('end_time > ?', now.yesterday).where('end_time < ?', now)
      reservations.each do |reservation|
        # :day_after_todayのバリデーションに引っかかるので、バリデーションの方を削除
        reservation.update(status: :completed) #ステータスを3(completed施術完了)に切り替え
      end
    end

    def set_q
      @q = Reservation.includes(:guest).ransack(params[:q])
    end

    def set_new
      @reservation = Reservation.new
    end

end
