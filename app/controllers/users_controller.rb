class UsersController < ApplicationController
  # indexとshowはスタッフのみのログインで可能
  skip_before_action :authenticate_user!, only: [:index, :show, :admin_edit, :admin_update, :admin_destroy]
  skip_before_action :authenticate_staff!, only: [:account] # 抜けていたので追記しました

  def index
    @users = User.all.order(id: "ASC")
  end

  def admin_edit
    @user = User.find(params[:format])
  end

  def admin_update
    @user = User.find(params[:format])
    if @user.update(user_params)
      flash[:success] = "#{@user.name} さんの情報を更新しました。"
      redirect_to users_index_path(current_staff)
    else
      flash[:danger] = "お客様情報の編集に問題がありました"
      render :admin_edit
    end
  end

  def admin_destroy
    @user = User.find(params[:format])
    if @user.destroy
      flash[:success] = "#{@user.name} さんの情報を削除しました。"
    else
      flash[:danger] = "お客様情報の削除に問題がありました"
    end
    redirect_to users_index_path(current_staff)
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

  private
    def set_q
      @q = User.ransack(params[:q])
    end

    def user_params
      params.require(:user).permit(:name, :email, :kana, :sex, :birthday, :store_id, :postal_code, :prefecture_code, :city, :street, :other_address)
    end

end
