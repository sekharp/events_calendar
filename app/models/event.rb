class Event < ActiveRecord::Base
  def self.format_track(start, track)
    event ||= Event.find_by(start: start, track: track)
    all_track_event ||= Event.find_by(start: start, track: ["Lunch", "Keynote", "Coffee Breaks", "Party"])
    if event
      event.name
    elsif all_track_event
      all_track_event.name
    end
  end
end
