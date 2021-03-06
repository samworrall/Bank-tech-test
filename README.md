[![Build Status](https://travis-ci.org/samworrall/Bank-tech-test.svg?branch=master)](https://travis-ci.org/samworrall/Bank-tech-test)
# Bank Tech Test

This is the Bank Tech Test from tech test week at Makers Academy, designed to prepare us for the job searching process.

The aim of this test was to show OOP skills, along with an understanding of basic OOP concepts such as single responsibility and delegation, whilst keeping code DRY, readable, and easily changed.

This project is 100% test driven and has 100% test coverage.

## User Stories

```
As a User,
So that I can keep track of my money,
I would like to be able to view my balance.
```

```
As a User,
So that I can keep my money safe,
I would like to be able to make a deposit.
```

```
As a User,
So that I can spend my money,
I would like to be able to make a withdrawal.
```

```
As a User,
So that I can review my banking history,
I would like to be able to see an account statement.
```


## Organisation

My Trello board:

<a href="https://trello.com/b/qFaoCJ6E/bank-tech-test"><img src="logos/Trello.png" height="60" width="140"></a>


## Approach

I began by creating some basic user stories (shown above), which I then added to my Trello board along with various other set up tickets.

I also jotted down some initial ideas on objects and their messages (which would actually change later on).

I started with an Account object, which had a deposit method and a withdraw method, both of which manipulated the class' balance instance variable. I also added an error if the user attempted to withdraw more than they had in their balance.

After this basic functionality was implemented, I tried to extract a new class, Transaction, which would take care of formatting the data into a string. This Transaction class would be instantiated inside both the deposit and withdraw methods, and pushed to a transaction log attribute variable. I did not like this, as I could not mock the dependency the Account now had on the Transaction class. To amend this, I changed how the two classes interacted. Now, the Account class would be instantiated with a Transaction object by default, and this object would then be used within the Account methods, allowing me to mock the Transaction object in the tests.

I finally added the functionality to pretty print the transaction history to the Transaction class. This way, I felt that the Account class was delegating the functionality it did not care about to the Transaction class.

To take this further/improve, perhaps a new Print class could be extracted from the Transaction class.


Update 19/06/2018:

I have updated the program, which now has a separate Printer class which has responsibility for printing a given statement. I felt as if the Transaction class should only be responsible for logging transactions and not formatting them for printing. I have made sure to mock this new dependency in the tests. I have also since mocked Time in the tests.

Update 20/06/2018:

I have added a feature spec that gets run when rspec is called in the terminal. All tests pass and all the relevant features have been tested.


## Instructions

Clone this repo to your local machine
```
git clone git@github.com:samworrall/Bank-tech-test.git
```

Install the necessary gems
```
$ bundle install
```

Run RSPec to ensure the tests all pass
```
$ rspec
```

Play around in IRB to see the functionality
```
$ irb -r ./lib/account.rb
```


## Example

account = Account.new

account.deposit(50)

account.deposit(100)

account.withdraw(50)

account.view_statement

```
Date || Credit || Debit || Balance
20/06/2018 || 0 || 50 || 100
20/06/2018 || 100 || 0 || 150
20/06/2018 || 50 || 0 || 50
```
