require_relative 'building'
require_relative 'lift'

building = Building.new(
  {
  'a' => Lift.new(reference: 'A', current_floor: (-2..30).to_a.sample),
  'b' => Lift.new(reference: 'B', current_floor: 20, target: nil)
  }
)
begin
  puts 'What is your floor ?'
  puts "You have 2 lifts #{building.lifts.values.map(&:reference).join(', ')}"
  response = gets.chomp
  puts "Go to the lift #{building.call_lift(gets.chomp)}" if response
rescue InvalidFloor
  puts "The floor #{response} is invalid"
end

