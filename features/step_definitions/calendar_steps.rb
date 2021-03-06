Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that event to the database here.
		puts event

    startHour = 9
    startMin = 59

    start_dt = DateTime.new(Time.now.year, Time.now.month, Time.now.day, startHour, startMin)
    end_dt = DateTime.new(Time.now.year, Time.now.month, Time.now.day, startHour+1, startMin)

		e = Event.new(event)
    e.start_at = start_dt
    e.end_at = end_dt
    e.save
  end
end

