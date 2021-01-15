class EventsController < ApplicationController
  before_action :find_sche, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(sche_params)
    if @event.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @event.update!(sche_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    if @event.destroy!
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def find_sche
    
  end

  def sche_params
    params.require(:event).permit(:title, :body, :start_date, :end_date)
  end
end
