require 'spec_helper'
require 'statement'

describe Statement do
  describe('#print') do
    it('prints out the transaction history in reverse order') do
      transactions = [{date: "01/10/2010", credit: 100, balance: 100}, {date: '02/11/2010', debit: 50, balance: 50}]
      statement = Statement.new
      expect { statement.print(transactions) }.to output("date || credit || debit || balance\n02/11/2010 ||  || 50.00 || 50.00\n01/10/2010 || 100.00 ||  || 100.00\n").to_stdout
    end
  end
end
