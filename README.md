# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    * ruby 3.0.0p0

* Rails version
    * Rails 6.1.7

* Postgres Version
	* postgres 10

* System dependencies
    * Ubuntu [x86_64-linux]

* Configuration
    * It's necessary to have ruby on rails and postgres installed to run this project.

* How to run the project
    * bundle install
	* rails db:create
	* rails db:migrate
	* rails db:seed
	* rails s -p 3001

* How to run the test suite
    * rspec

* Observations
    * The total cost and total tax paid information is being calculated in runtime. This can lead to performance issue in case there are many entries. If this is the case it's recomended to calculate this information after each item is created, using a trigger for example.

    * In the assignment there were no specification regarding rounding in cases other than calculating the salex tax. However, there were some cases for example when switching the currencies which generated price values with many decimal places. For these cases the rounding rule applied was to round to two decimal places.


* ...
# salestax
