require 'spec_helper'
require 'statement'

describe Statement do

  describe('#print') do
    it('prints out a statement') do
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
      statement = Statement.new
      expect { statement.print(transactions) }.to output(
        [
          "Date: 01/10/2018 || Credit: 10 || Balance: 10",
          "Date: 02/10/2018 || Debit: 6 || Balance: 4\n"
        ].join("\n")
      ).to_stdout
    end
  end

end
