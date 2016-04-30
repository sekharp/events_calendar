class EventsController < ApplicationController
  def index
    @events = Event.all.order("start DESC")
  end
end
