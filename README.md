# At Your Service
  Web application for handling orders, foods, waiters, customers and tables into a restaurant.
  * Requirements
    * Ruby 2.X
    * Rails 4.2+
    * MySQL 5.X
  * Uses coffescript, ransack for searching, prawn for pdf generation, devise for authentication, slim and simple_form.

## Getting started

* Install gems
```shell
bundle install
```
* Create database
```shell
rake db:create
```
* Run Migrations
```shell
rake db:migrate
```
* (Optional) fill data for development
```shell
rake db:seed
```
* Start rails server and go to [http://localhost:3000](http://localhost:3000/)

## Running Tests

* Prepare database first
```shell
rake db:test:prepare
```
* Run tests with `rspec`

## Feedback

Contact me if any problems encountered.
