require 'spec_helper'
require 'account'

describe Account do
  context('transactions') do
    describe('#deposit') do
      it('adds amount to balance') do
        account = Account.new
        expect { account.deposit(10) }.to change { account.balance }.by(10)
      end

      it('adds transaction to transactions array') do
        account = Account.new
        expect { account.deposit(100) }.to change { account.transactions }.by(1)
      end
    end

    describe('#withdraw') do
      context('with sufficient funds') do
        it('subtracts amount from balance ') do
          account = Account.new
          account.deposit(10)
          expect { account.withdraw(10) }.to change { account.balance }.by(-10)
        end
      end
      context('with insuficcient funds') do
        it('raies an error') do
          account = Account.new
          expect { account.withdraw(10) }.to raise_error('Unable to withdraw: insufficient funds!')
        end
      end
    end
  end
end
