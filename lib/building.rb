class Building
  attr_reader :lifts

  def initialize(lifts)
    @floors = floors
    @lifts = lifts
  end

  def floors
    @floors ||= (-2..30).to_a
  end

  def call_lift(floor)
    result = {}
    @lifts.each do |_ref, lift|
      result[lift.reference] = calculate_distance(floor, lift)
    end
    min_distance = result.values.min
    result.key(min_distance)
  end

  def calculate_distance(floor, lift)
    return 0 if lift.current_floor == floor && (lift.target.nil?)
    #on prend l'etage ou il est appelé
    user_floor = floor.to_i
    if lift.target
      distance_to_target = lift.current_floor - lift.target
      distance_to_floor = user_floor - lift.target

      (distance_to_floor + distance_to_target).abs
    else
      (floor - lift.current_floor).abs
    end
  end
end
