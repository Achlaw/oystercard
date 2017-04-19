require 'station'

describe Station do
  let(:station){described_class.new('oxford', 1)}
  it 'does have a name' do
    expect(station.name).to eq 'oxford'
  end
  it 'does have a zone' do
    expect(station.zone).to eq 1
  end
end
