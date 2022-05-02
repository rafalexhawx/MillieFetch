# MilliFetch
A Rails web app allowing users to navigate through the files of the bush library online.\
Users will be able to:
* Enter a search query, and find all relevant folders
* Export all the files they are interested in

Admins will be able to:
* Login
* Upload files

## Setup
This section covers setting up the 1) developement enviroment and test enviroment 2) running test cases and 3) finally running the application in local or aws c9

Ruby version:
| Local computer setup |
|-----|
Ensure that Ruby 2.7.5 is installed.
```sh
$ ruby -v
```

Clone the repository:
```sh
$ git clone https://github.com/rafalexhawx/MillieFetch.git
```

Install dependencies:

Run Bundler, to make sure all the app's gems are installed. Switch to the app's root directory (presumably /Milliefetch) and run bundle install --without production
```sh
$ bundle install
```

Make the development db ready:
```sh
$ rake db:create
$ rake db:migrate
```
db:create will create an empty database for you and db:migrate runs the migrations in db/migrate to create the app's schema. It also creates/updates the file db/schema.rb to reflect the latest database schema. Note: it's important to keep this file under version control. 

To fill the developement db, run following
```sh
$ rake db:seed
```

To fill the test db, run following
```sh
$ rake db:seed RAILS_ENV='test'
```

Note: For our project we used same data from test db as it was for development. If loading the sample of actual data is going to be a problem in future, developers can shift to using FactoryGirl fixtures.

Run all the cucumber scenarios
```sh
$ rake cucumber:all
```

Run all the rspec testcases
```sh
$ rspec spec/
```

This branch should have all the testcases passed.

Run the application in the local machine with following
```sh
$ rails server
```

If the user is trying to run the application in aws cloud 9, do following
```sh
$ rails s -p $PORT -b $IP
```
For aws cloud 9, please be sure to add config.hosts << something.vfs.cloud9.us-east-1.amazonaws.com (this value is custom to the aws c9 instance you are running) in config/enviroments/development.rb
