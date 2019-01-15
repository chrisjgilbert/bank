# Bank Tech Test in Ruby

## My approach   
I began this challenge by diagramming out the classes and their respective behaviour and state using CRC cards. It became apparent from this that I would need an Account class responsible for transactions, a Statement class responsible for printing a statement and a DateFormatter responsible for getting the date and formatting as required.

After this planning stage, I started the TDD process by creating the Account class and it's core transaction methods: deposit and withdraw.

Once this was done I created the DateFormatter as I needed this to give me the date in a pretty format to add into the transaction history. I then finally added the Statement class which just printed out the transaction history with a header.

## Testing
* Tested using RSpec   
* To run `rspec` in project root    
* 100% test coverage

## Linting
* I used Rubocop a Linter   
* No outstanding offenses   
* To run `rubocop` in project root   

## How To Use
* `git clone https://github.com/chrisjgilbert/bank`   
* `cd bank`   
* `irb`   
* `require './lib/account'`   
* `account = Account.new`
* `account.deposit(amount)` to deposit
* `account.withdraw(amount)` to withdraw
* `account.print_statement` to view statement    
* Note: you must have enough funds to withdraw!

## Acceptance Criteria   
* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
* Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## My Version   
```
.5.1 :001 > require './lib/account'
 => true
2.5.1 :002 > account = Account.new
 => #<Account:0x00007f8b6007ae20 @balance=0, @transactions=[], @statment=#<Statement:0x00007f8b6007adf8>, @date_formatter=#<DateFormatter:0x00007f8b6007add0 @date=Date>>
2.5.1 :003 > account.deposit(1000)
 => [{:date=>"15/01/2019", :credit=>1000, :balance=>1000}]
2.5.1 :004 > account.deposit(2000)
 => [{:date=>"15/01/2019", :credit=>1000, :balance=>1000}, {:date=>"15/01/2019", :credit=>2000, :balance=>3000}]
2.5.1 :005 > account.withdraw(500)
 => [{:date=>"15/01/2019", :credit=>1000, :balance=>1000}, {:date=>"15/01/2019", :credit=>2000, :balance=>3000}, {:date=>"15/01/2019", :debit=>500, :balance=>2500}]
2.5.1 :006 > account.print_statement
date || credit || debit || balance
15/01/2019 ||  || 500.00 || 2500.00
15/01/2019 || 2000.00 ||  || 3000.00
15/01/2019 || 1000.00 ||  || 1000.00
```
