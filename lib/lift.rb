class Lift
  attr_reader :reference, :current_floor, :target

  def initialize(reference:, current_floor:, target: (0..30).to_a.sample)
    @reference = reference
    @current_floor = current_floor
    @target = target
  end
end
