class EventsController < ApplicationController
    #skip_before_action :authenticate_user!
    skip_before_action :authenticate_staff!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    
  end

  def new
  end

  def create
    
  end

  def edit
  end

  def update
    
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "#{@event.title} を削除しました。"
    redirect_to events_path(current_user)
  end

  private
    def event_params
      params.require(:event).permit(:title, :category, :price, :image, :description, :location, :first_date, :last_date, :start_time, :end_time, :start_time_alt, :end_time_alt, :ticket_numbers, :status, :owner_id, :store_id)
    end

    def set_q
      @q = Event.ransack(params[:q])
    end
end
