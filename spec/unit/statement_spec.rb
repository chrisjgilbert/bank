require 'spec_helper'
require 'statement'

describe Statement do
  describe('#print') do
    it('prints out the transaction history') do
      transactions = [{date: "01/10/2010", credit: 100, balance: 100}]
      statement = Statement.new
      expect { statement.print(transactions) }.to output("date || credit || debit || balance\n01/10/2010 || 100 ||  || 100\n").to_stdout
    end
  end
end
