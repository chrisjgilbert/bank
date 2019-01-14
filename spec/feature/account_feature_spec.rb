require 'spec_helper'
require 'account'

describe 'account feature' do
  context('transactions') do
    it('allows a user to deposit funds into their account') do
      account = Account.new
      expect { account.deposit(5) }.not_to raise_error
    end

    it('allows a user to withdraw funds into their account if they have enough funds') do
      account = Account.new
      account.deposit(10)
      expect { account.withdraw(5) }.not_to raise_error
    end

    it('does not allow a user to withdraw funds if they have insuficcient funds') do
      account = Account.new
      expect { account.withdraw(5) }.to raise_error
    end
  end
end
