require 'spec_helper'

describe Account do

  context('transactions') do
    describe('#deposit') do
      it('adds amount to balance') do
        account = Account.new
        expect { account.deposit(10) }.to change { account.balance }.by(10)
      end
    end
  end
end
