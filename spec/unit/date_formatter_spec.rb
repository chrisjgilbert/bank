require 'spec_helper'
require 'date_formatter'

describe DateFormatter do

  describe('#getDate') do
    it('formats the date in DD/MM/YYYY') do
      date = double(:date)
      today = DateFormatter.new(date)
      allow(date).to receive(:today).and_return(date)
      allow(date).to receive(:strftime).and_return("14/01/2019")
      expect(today.getDate).to eq("14/01/2019")
    end
  end

end
