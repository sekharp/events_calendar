class Event < ActiveRecord::Base
  def self.format_track(start, ending, track)
    event ||= Event.find_by(start: start, end: ending, track: track)
    all_track_event ||= Event.find_by(start: start, end: ending, track: ["Lunch", "Keynote", "Coffee Breaks", "Party"])
    if event
      event.name
    elsif all_track_event
      all_track_event.name
    end
  end
end
