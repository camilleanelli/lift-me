class InvalidFloor < StandardError;end

class Building
  attr_reader :lifts

  def initialize(lifts, min_floor = -2, max_floor = 30)
    @lifts = lifts
    @min_floor = min_floor
    @max_floor = max_floor
    @floors = floors
    @users = { 'jp' => User.new(4), 'mario' => User.new(10) }
  end

  def floors
    @floors ||= (@min_floor..@max_floor).to_a
  end

  def call_lift(floor)
    raise InvalidFloor unless @floors.include?(floor)
    result = {}
    @lifts.each do |_ref, lift|
      result[lift.reference] = calculate_distance(floor, lift)
    end
    min_distance = result.values.min
    result.key(min_distance)
    # modifie le stop du lift
  end

  def calculate_distance(floor, lift)
    return 0 if lift.current_floor == floor && (lift.target.nil?)
    user_floor = floor
    if lift.target
      distance_to_target = lift.current_floor - lift.target
      distance_to_floor = user_floor - lift.target

      (distance_to_floor + distance_to_target).abs
    else
      (user_floor - lift.current_floor).abs
    end
  rescue NoMethodError
    raise InvalidFloor
  end
end
