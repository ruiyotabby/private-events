class UsersController < ApplicationController
  def show
    @events = Event.includes(:creator).where('creator_id = ?', current_user.id)
  end
end
