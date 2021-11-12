class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  def top
  end
end
