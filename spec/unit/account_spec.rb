require 'spec_helper'
require 'account'

describe Account do

  let(:statement) { double(:statement) }
  let(:date_formatter) { double(:date_formatter, getDate: '01/01/2001') }
  let(:subject) { described_class.new(statement, date_formatter) }

  context('transactions') do
    describe('#deposit') do
      it('adds amount to balance') do
        expect { subject.deposit(10) }.to change { subject.balance }.by(10)
      end

      it('adds transaction to transactions array') do
        expect { subject.deposit(100) }.to change { subject.transactions.length }.by(1)
      end

      it('adds date to transaction') do
        expect(date_formatter).to receive(:getDate)
        subject.deposit(10)
      end

      it('adds complete transaction detail to transactions') do
        subject.deposit(5)
        expect(subject.transactions).to eq [{:date=>"01/01/2001", :credit=>5.00, :balance=>5.00}]
      end
    end

    describe('#withdraw') do
      context('with sufficient funds') do
        before(:each) do
          allow(subject).to receive(:insufficient_funds?).and_return(false)
        end
        it('subtracts amount from balance ') do
          expect { subject.withdraw(10) }.to change { subject.balance }.by(-10)
        end
        it('adds transaction to transactions array') do
          expect { subject.withdraw(50) }.to change { subject.transactions.length }.by(1)
        end
        it('adds date to transaction') do
          expect(date_formatter).to receive(:getDate)
          subject.withdraw(10)
        end
        it('adds complete transaction detail to transactions') do
          subject.deposit(100)
          subject.withdraw(5)
          expect(subject.transactions).to eq [{:balance=>100.00, :credit=>100.00, :date=>"01/01/2001"}, {:balance=>95.00, :date=>"01/01/2001", :debit=>5.00}]
        end
      end
      context('with insuficcient funds') do
        it('raies an error') do
          expect { subject.withdraw(10) }.to raise_error('Unable to withdraw: insufficient funds!')
        end
      end
    end

    describe('#print_statement') do
      it('calls on statement to print') do
        expect(statement).to receive(:print).with(subject.transactions)
        subject.print_statement
      end
    end
  end
end
