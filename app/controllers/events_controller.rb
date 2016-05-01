class EventsController < ApplicationController
  def index
    @dates = Event.uniq.pluck(:start).map! { |t| t.strftime("%m/%d/%Y") }.uniq
  end

  def show
    @events = Event.all.order("start ASC")
    @event = Event
    @tracks = Event.uniq.pluck(:track).sort.select { |t| t[0] == "T" }
    @times = @events.uniq.pluck(:start, :end)
  end
end
