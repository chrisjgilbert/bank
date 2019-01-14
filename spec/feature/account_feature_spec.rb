require 'spec_helper'
require 'account'

describe 'account feature' do

  context('transactions') do
    it('allows a user to deposit funds into their account') do
      account = Account.new
      expect { account.deposit(5) }.not_to raise_error
    end
  end

end
