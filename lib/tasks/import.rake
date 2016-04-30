require 'csv'

desc 'Import events from CSV file'
task :import => [:environment] do

  books = "lib/data/test_events.csv"

  CSV.foreach(events, :headers => true) do |row|
    event = Event.create!(row.to_hash)
    puts "Created Event ID #{event.id}: #{event.name} on track #{event.track}, from #{event.start} to #{event.end}"
  end

end
