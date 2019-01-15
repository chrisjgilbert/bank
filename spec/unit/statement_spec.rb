require 'spec_helper'
require 'statement'

describe Statement do
  describe('#print') do
    it('prints out a statement header') do
      statement = Statement.new
      expect { statement.print }.to output("date || credit || debit || balance\n").to_stdout
    end

    it('prints out the transaction history') do
      transactions = [{date: "01/10/2010", credit: 100, balance: 100}]
      statement = Statement.new
      expect { statement.print(transactions) }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
