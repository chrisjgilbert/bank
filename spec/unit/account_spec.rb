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
        expect { account.deposit(100) }.to change { account.transactions.length }.by(1)
      end

      it('adds date to transaction') do
        date_formatter = double(:date_formatter, getDate: '01/01/2001')
        statement = double(:statement)
        account = Account.new(statement, date_formatter)
        expect(date_formatter).to receive(:getDate)
        account.deposit(10)
      end
    end

    describe('#withdraw') do
      context('with sufficient funds') do
        it('subtracts amount from balance ') do
          account = Account.new
          account.deposit(10)
          expect { account.withdraw(10) }.to change { account.balance }.by(-10)
        end
        it('adds transaction to transactions array') do
          account = Account.new
          account.deposit(100)
          expect { account.withdraw(50) }.to change { account.transactions.length }.by(1)
        end
        it('adds date to transaction') do
          date_formatter = double(:date_formatter, getDate: '01/01/2001')
          statement = double(:statement)
          account = Account.new(statement, date_formatter)
          allow(account).to receive(:insufficient_funds?).and_return(false)
          expect(date_formatter).to receive(:getDate)
          account.withdraw(10)
        end
      end
      context('with insuficcient funds') do
        it('raies an error') do
          account = Account.new
          expect { account.withdraw(10) }.to raise_error('Unable to withdraw: insufficient funds!')
        end
      end
    end

    describe('#print_statement') do
      it('calls on statement to print') do
        statement = double(:statement, print: 'print')
        account = Account.new(statement)
        expect(statement).to receive(:print)
        account.print_statement
      end
    end
  end
end
