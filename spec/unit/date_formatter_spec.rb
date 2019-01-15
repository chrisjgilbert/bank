require 'spec_helper'
require 'date_formatter'

describe DateFormatter do
  describe('#getDate') do
    let(:date) { double(:date) }
    let(:subject) { described_class.new(date) }
    it('formats the date in DD/MM/YYYY') do
      allow(date).to receive(:today).and_return(date)
      allow(date).to receive(:strftime).and_return('14/01/2019')
      expect(subject.getDate).to eq('14/01/2019')
    end

    it('calls today on date') do
      allow(date).to receive(:strftime)
      expect(date).to receive(:today).and_return(date)
      subject.getDate
    end

    it('calls strftime on date') do
      allow(date).to receive(:today).and_return(date)
      expect(date).to receive(:strftime)
      subject.getDate
    end
  end
end
