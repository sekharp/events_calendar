class EventsController < ApplicationController
  def index
    @events = Event.all.order("start ASC")
    @tracks = Event.uniq.pluck(:track).sort.select {|t| t[0] == "T"}
    @starts = Event.uniq.pluck(:start).sort
  end
end
