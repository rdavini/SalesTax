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
    * In the assignment spefication it says that a basic tax of 10% is applied to all the products except books, food, and medical products. This solution only checks the item description to find one of the following strings ['book', 'food', 'medical'] which is defined in the seeds.rb file. If an user creates a product with the following description 'chocolate bar', it's a food however the basic tax will be applied because the solution doesn't know that a chocolate is a food. If the keywork 'chocolate' is added to ItemTypeFreeTax inside seeds.rb. Then the basic tax rule will be applied for this case. The method that verifies if the basic tax is applied or not or if the imported tax is applied or not is case sensitive. Therefore a new item 'book' will be free of tax while 'BOOK' will be taxed. A simple solution to this case is just to convert the pattern and the description entry to upercase before the testing condition.

    * The total cost and total tax paid information is being calculated in runtime. This can lead to performance issue in case there are many entries. If this is the case it's recomended to calculate this information after each item is created, using a trigger for example.

    * In the assignment there were no specification regarding rounding in cases other than calculating the salex tax. However, there were some cases for example when switching the currencies which generated price values with many decimal places. For these cases the rounding rule applied was to round to two decimal places.


* ...
# salestax
