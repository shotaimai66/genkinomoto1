class StaffsController < ApplicationController
  # スタッフのみのログインで以下のアクションが可能
  skip_before_action :authenticate_user!

  def index
  end

  def show
  end
  
  def account
  end
end
