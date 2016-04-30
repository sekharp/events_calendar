class EventsController < ApplicationController
  def index
    @events = Event.all.order("start ASC")
  end
end
