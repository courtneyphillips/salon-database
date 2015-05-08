
User Stories:

As an salon owner, I want to view, add, update and delete stylists.
As a salon owner, I want to view, add, update and delete clients.
As a salon owner, I want to add clients to a stylist.


#Salon Management

---

#### Links

  - Heroku: https://pacific-fjord-4327.herokuapp.com/
  -Please note that CSS styles did _not_ upload correctly to Heroku.
  - GitHub: https://github.com/courtneyphillips/interactive-dictionary

## Synopsis

Interactive Dictionary is a simple Ruby application built by [Courtney Phillips](https://github.com/courtneymaepdx) with the ability to collect user-input words, and correlate them with their user-given definitions.

## Motivation

The Hair Salon Management app was created with the following needs of salon owners in mind, as depicted by user stories:

As an salon owner, I want to view, add, update and delete stylists.
As a salon owner, I want to view, add, update and delete clients.
As a salon owner, I want to add clients to a stylist.

## Database Setup

``# psql
username=# CREATE DATABASE hair_salon;
username=# \c hair_salon;
train_system=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
train_system=# CREATE TABLE sylists (id serial PRIMARY KEY, name varchar);
train_system=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;``


## Code Example

The magic behind the Interactive Dictionary is a set of custom `Word` and `Definition` classes with methods such as `Word#save`, `Word.clear`, `Word#define`, `Word.all`, `Definition#save`,`Definition.clear` and `Definition.all` method that act in sync to store, recall and correlate words and their relevant definitions. See example below:

  ``test_word = Word.new({:term => "Spiders"})
    test_word.define("The spookiest!")
    test_word.define("really yucky")
    test_word.definitions
    ==> ["the spookiest", "really yucky"]))``

## Contribute

  - Issue Tracker: https://github.com/courtneymaepdx/interactive-dictionary/issues
  - Source Code: https://github.com/courtneymaepdx/interactive-dictionary
  - Pull Requests: https://github.com/courtneymaepdx/interactive-dictionary/pulls

## Installation

Interactive Dictionary uses the following gems:

  - Capybara
  - Sinatra
  - Sinatra-Contrib
  - RSpec
  - Pry

To install, run `gem install bundle` in the command line.

## Tests

Both method and integration tests for Interactive Dictionary utilize the RSpec. Simply run `gem install rspec`, if it's not already installed, simply issue the command `rspec`, while located in the project's file.

## Contact

Questions, concerns, fan-mail, or other grievances can be directed to Courtney at <courtney.mae.phillips@gmail.com>.

## License

The MIT License (MIT)

Copyright (c) 2015 Courtney Phillips

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

---
