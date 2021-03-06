require 'oystercard'
require 'journey'

describe Oystercard do
let(:entry_station){double :station}
let(:exit_station){double :station}
let(:set_journey){ { entry_station: entry_station, exit_station: exit_station } }


  it 'has a balance of zero' do
     expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it 'raise error when over balance limit' do
      expect{ subject.top_up(91) }.to raise_error "ERROR: balance over maximum limit of #{described_class::MAX_BALANCE}"
    end
  end

  describe '#deduct' do
    it 'should deduct from balance' do
      subject.top_up(6)
      subject.touch_in(entry_station)
      expect{ subject.touch_out(exit_station)}.to change { subject.balance }.by -described_class::MIN_BALANCE
    end
  end

  describe '#touch_in' do
    #let (:station){double(:station)}

    it 'gives error when balance is insufficient' do
      expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance."
    end

    it 'forgets point of entry' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end

    it 'deducts balance after #touch_out' do
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-1)
    end
  # 
  #   it 'deducts penalty fare when not touched out' do
  #     subject.top_up(7)
  #   subject.touch_in(entry_station)
  #   expect { subject.touch_in(entry_station) }.to change{ subject.balance }.by(-6)
  # end
  end

  describe '#in_journey?' do
    before do
      subject.top_up(described_class::MIN_BALANCE)
      subject.touch_in(entry_station)
    end

  end

end
