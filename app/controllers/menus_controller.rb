class MenusController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
    
  def index
    @menus = Menu.all.page(params[:page]).per(6)
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:success] = "#{@menu.treatment_detail}の登録に成功しました"
      redirect_to menus_path
    else
      flash[:danger] = "施術メニューの登録に問題がありました"
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      flash[:success] = "#{@menu.treatment_detail}の情報を更新しました"
      redirect_to menus_path
    else
      flash[:danger] = "施術メニューの編集に問題がありました"
      render :edit
    end
  end

  def destroy
    @menu.destroy
    flash[:success] = "#{@menu.treatment_detail} を削除しました。"
    redirect_to menus_path
  end

  private
    def menu_params
      params.require(:menu).permit(:treatment_detail, :charge, :treatment_time)
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end

end
