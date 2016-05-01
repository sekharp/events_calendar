class EventsController < ApplicationController
  def index
    @dates = Event.uniq.pluck(:start).map! { |t| t.strftime("%m/%d/%Y") }.uniq
  end

  def show
    month = params["id"][0..1]
    day = params["id"][3..4]
    real_date = day + "/" + month + "/" + params["id"][6..9]
    t = Time.parse(real_date)
    @events = Event.where(start: t..(t+1.day)).order("start ASC")
    @event = Event
    @tracks = Event.uniq.pluck(:track).sort.select { |t| t[0] == "T" }
    @times = @events.uniq.pluck(:start, :end)
  end
end
