
#Salon Management

---

#### Links

  - GitHub: https://github.com/courtneyphillips/interactive-dictionary

## Synopsis

Salon Management is a simple Ruby application built by [Courtney Phillips](https://github.com/courtneymaepdx) with the ability to record hairstylists and their corresponding clients into a database for later recall. Both stylists and clients entries can then be edited as necessary.

## Motivation

The Hair Salon Management app was created with the following needs of salon owners in mind, as depicted by user stories:

  - As an salon owner, I want to view, add, update and delete stylists.
  - As a salon owner, I want to view, add, update and delete clients.
  - As a salon owner, I want to add clients to a stylist.

## Database Setup

```# psql``
username=# CREATE DATABASE hair_salon;
username=# \c hair_salon;
hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
hair_salon=# CREATE TABLE sylists (id serial PRIMARY KEY, name varchar);
hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;```

## Contribute

  - Issue Tracker: https://github.com/courtneyphillips/salon-database/issues
  - Source Code: https://github.com/courtneyphillips/salon-database
  - Pull Requests: https://github.com/courtneyphillips/salon-database/pulls

## Installation

Interactive Dictionary uses the following gems:

  - Capybara
  - Sinatra
  - Sinatra-Contrib
  - RSpec
  - Pry
  - PG

To install, run `gem install bundle` in the command line.

## Tests

Both method and integration tests for Salon Management utilize the RSpec. Simply run `gem install rspec`, if it's not already installed, simply issue the command `rspec`, while located in the project's file.

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
