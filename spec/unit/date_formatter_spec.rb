require 'spec_helper'
require 'date_formatter'

describe DateFormatter do

  describe('#getDate') do
    it("formats the date in DD/MM/YYYY") do
      today = DateFormatter.new
      expect(today.getDate).to eq("14/01/2019")
    end
  end

end
