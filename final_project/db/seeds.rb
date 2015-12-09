(1..10).each do |index|
  m = Map.create(table: "map #{index}",
    user_id: "#{index +1}",
    description: "description #{index}",
    city: "city #{index}",
    state: "state #{index}",
    date1: Date.new,
    date2: Date.new,
    shared: true)
end
