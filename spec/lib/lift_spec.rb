require 'spec_helper'

RSpec.describe Lift do

  describe 'new lift' do
    let(:lift) { Lift.new(reference: 'A', target: 30, current_floor: 2) }

    it 'works' do
      expect(lift).to be_kind_of(Lift)
    end

    it 'has a reference' do
      expect(lift.reference).to eq 'A'
    end

    it 'has a current_floor' do
      expect(lift.current_floor).to eq 2
    end

    it 'could have a target' do
      expect(lift.target).to eq 30
    end

    it 'does not have target' do
      lift = Lift.new(reference: 'B', target: nil, current_floor: 2)
      expect(lift.target).to eq nil
    end
  end
end
