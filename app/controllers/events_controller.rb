class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.includes(:creator).all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = current_user.events.build

    if @event.update(event_params)
      redirect_to @event, notice: 'Successfully edited'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other, notice: 'Event sucessfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
