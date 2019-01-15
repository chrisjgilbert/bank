require 'spec_helper'
require 'statement'

describe('statment') do
  it('prints out a statement') do
    statement = Statement.new
    transactions = [
      {
        date: '01/10/2018',
        type: 'Credit',
        amount: 10,
        balance: 10
      },
      {
        date: '02/10/2018',
        type: 'Debit',
        amount: 6,
        balance: 4
      }
    ]
    expect { statement.print(transactions) }.not_to raise_error
  end
end
