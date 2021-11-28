class StaffsController < ApplicationController
  # スタッフのみのログインで以下のアクションが可能
  skip_before_action :authenticate_user!

  def index
    @staffs = Staff.all
  end

  def show
    @staff = Staff.find(params[:id])
  end
  
  def account
  end
end
