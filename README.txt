Web application for handling orders, foods, waiters, customers and tables into a restaurant.
  * Requirements
    * Ruby 2.X
    * Rails 4.2+
    * MySQL 5.X
  * Uses coffescript, ransack for searching, prawn for pdf generation, devise for authentication, slim and simple_form.

Getting started

* Create database
  rake db:create

* Run Migrations
  rake db:migrate

* (Optional) fill data for development
  rake db:seed

* Start rails server and go to http://localhost:3000

Testing
  * Tests developed with rspec+factory girl, be sure to prepare database first
    rake db:test:prepare
  * Run tests with rspec

Feedback

Contact me if any problems encountered.
