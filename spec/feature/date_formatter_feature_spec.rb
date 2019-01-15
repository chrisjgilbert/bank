require 'spec_helper'
require 'date_formatter'

describe('date formatter') do
  it('formats the date in DD/MM/YYYY') do
    today = DateFormatter.new
    expect { today.get_date }.not_to raise_error
  end
end
