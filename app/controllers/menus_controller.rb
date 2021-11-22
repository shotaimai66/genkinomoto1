class MenusController < ApplicationController
  #スタッフは全てのアクションにアクセスできる
  skip_before_action :authenticate_user!
  #ゲストは施術メニュー一覧、施術メニュー詳細のみアクセスできる
  skip_before_action :authenticate_staff!, only: [:index, :show]
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
      flash[:success] = "#{@menu.title}の登録に成功しました"
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
      flash[:success] = "#{@menu.title}の情報を更新しました"
      redirect_to menus_path
    else
      flash[:danger] = "施術メニューの編集に問題がありました"
      render :edit
    end
  end

  def destroy
    @menu.destroy
    flash[:success] = "#{@menu.title} を削除しました。"
    redirect_to menus_path
  end

  private
    def menu_params
      params.require(:menu).permit(:course_number, :title, :description, :charge, :treatment_time)
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end

end
