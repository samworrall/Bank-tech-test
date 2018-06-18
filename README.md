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
