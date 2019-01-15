require 'spec_helper'
require 'statement'

describe Statement do
  describe('#print') do
    it('prints out a statement header') do
      statement = Statement.new
      expect { statement.print }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
