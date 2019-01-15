require 'spec_helper'
require 'statement'

describe('statment') do
  it('prints out a statement') do
    statement = Statement.new
    transactions = [
      {
        date: '01/10/2018',
        credit: 10,
        balance: 10
      }
    ]
    expect { statement.print(transactions) }.not_to raise_error
  end
end
