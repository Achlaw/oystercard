require 'journey'

describe Journey do
  let(:entry_station){double :station}
  let(:exit_station){double :station}
  let(:set_journey){ { entry_station: entry_station, exit_station: exit_station } }


it 'starts with no history' do
    expect(subject.journey_history).to be_empty
  end

    it 'records gets journey' do
      subject.begin_journey(entry_station)
      subject.final_journey(exit_station)
      expect(subject.journey_record).to include set_journey
    end

    it 'records point of entry' do
      expect(subject.begin_journey(entry_station)).to eq entry_station
    end


        it 'returns true when touched in' do
          subject.begin_journey(entry_station)
          expect(subject).to respond_to(:in_journey?)
        end


            it 'returns false when touched out' do
              subject.final_journey(exit_station)
              expect(subject).to_not respond_to(:in_journey)
            end

end
