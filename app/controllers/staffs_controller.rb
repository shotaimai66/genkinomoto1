class StaffsController < ApplicationController
  # スタッフのみのログインで以下のアクションが可能
  skip_before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]

  def account
    store_id = current_staff.store_id
    @store = Store.find(store_id)
  end

  def index
    @staffs = Staff.all.page(params[:page]).per(10).order(id: "ASC")
  end

  def search
    @results = @q.result
  end

  def admin_edit
    @staff = Staff.find(params[:format])
  end

  def admin_update
    @staff = Staff.find(params[:format])
    if @staff.update(staff_params)
      flash[:success] = "#{@staff.name} さんの情報を更新しました。"
      redirect_to staffs_index_path(current_staff)
    else
      flash[:danger] = "お客様情報の編集に問題がありました"
      render :admin_edit
    end
  end

  def admin_destroy
    @staff = Staff.find(params[:format])
    if @staff.destroy
      flash[:success] = "#{@staff.name} さんの情報を削除しました。"
    else
      flash[:danger] = "お客様情報の削除に問題がありました"
    end
    redirect_to staffs_index_path(current_staff)
  end
  
  private
    def staff_params
      params.require(:staff).permit(:name, :email, :phone, :store_id)
    end

    def set_q
      @q = Staff.ransack(params[:q])
    end
end
