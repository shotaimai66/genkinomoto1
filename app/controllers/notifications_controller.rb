class NotificationsController < ApplicationController
  skip_before_action :authenticate_user!
  # skip_before_action :authenticate_user!, only: [:index, :show]
  skip_before_action :authenticate_staff!
  # skip_before_action :authenticate_staff!, only: [:index, :show, :new]

  def index
    @notifications = Notification.page(params[:page]).per(5)
  end

  def show
    @notification = Notification.find(params[:id])
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.staff_id = current_staff.id
    if @notification.save
      flash[:success] = '新規お知らせを投稿しました。'
      redirect_to @notification
    else
      flash[:notice] = '投稿に失敗しました。もう一度入力してください。'
      render :new
    end
  end

  def edit
    @notification = Notification.find(params[:id])
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_params)
      flash[:success] = 'お知らせの内容を更新しました。'
      redirect_to notifications_url
    else
      render :edit
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    flash[:success] = 'お知らせを削除しました。'
    redirect_to notifications_url
  end

  private
    def notification_params
      params.require(:notification).permit(:title, :body, :display_flag, :staff_id, :store_id)
    end
end
