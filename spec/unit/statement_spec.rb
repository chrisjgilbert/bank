require 'spec_helper'
require 'statement'

describe Statement do

  describe('#print') do
    it('prints out a statement') do
      transactions = [
        {
          date: '01/10/2018',
          type: 'credit',
          amount: 10.00,
          balance: 10.00
        },
        {
          date: '02/10/2018',
          type: 'debit',
          amount: 6.00,
          balance: 4.00
        }
      ]
      statement = Statement.new
      expect { statement.print(transactions) }.to output(
        [
          "Date: 01/10/2018 || Credit: 10.00 || Balance: 10.00",
          "Date: 02/10/2018 || Debit: 6.00 || Balance: 4.00"
        ].join("\n")
      ).to_stdout
    end
  end

end
