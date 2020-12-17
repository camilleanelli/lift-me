require 'spec_helper'

RSpec.describe Building do

  describe 'a building' do
    let(:lift1) { Lift.new(reference: '1', current_floor: 5, target: 30) }
    let(:lift2) { Lift.new(reference: '2', current_floor: 20, target: nil) }
    let(:building) { Building.new({ 'a' => lift1, 'b' => lift2 }) }

    it 'has floors between -2 and 30' do
      expect(building.floors.first).to eq -2
      expect(building.floors.last).to eq 30
    end

    it 'has 2 lifts' do
      expect(building.lifts.size).to eq 2
    end

    describe '#call_lift' do
      it 'renders the nearest lift' do
        result = building.call_lift(4)
        expect(result).to eq lift2.reference
      end

      it 'renders the lift which is at the same floor' do
        lift1 = Lift.new(reference: 'my_ref', current_floor: 5, target: nil)
        building = Building.new({ 'a' => lift1, 'b' => lift2 })

        result = building.call_lift(5)
        expect(result).to eq 'my_ref'
      end

      it 'raises an error if response is not valid' do
        expect { building.call_lift('toto') }.to raise_error InvalidFloor
      end
    end

    describe '#calculate_distance' do
      it 'renders the distance for a lift' do
        result = building.calculate_distance(7, lift1)
        expect(result).to eq 48
      end
    end
  end
end
