class TicketsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    ticket = current_user.tickets.build(attended_event: event)

    if ticket.save
      redirect_to event, notice: 'Successfully attended the event.'
    else
      redirect_to event, alert: 'Failed to attend the event.'
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    event.tickets.destroy.find_by(attendee: current_user)
  end
end
