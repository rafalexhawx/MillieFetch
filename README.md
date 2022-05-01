Intro: https://github.com/rafalexhawx/MillieFetch

In this git repository, you can build MillieFetch application as following instruction.
•	Whenever you start working on a Rails project, the first thing you should do is git clone the repository. You may use HTTPS or SSH to git clone our repo. 
-	HTTPS: https://github.com/rafalexhawx/MillieFetch.git
-	SSH: git@github.com:rafalexhawx/MillieFetch.git

•	And, make sure that you are using ruby version  2.7.5 for this application

$ ruby -v

•	The second things to do is to run Bundler, to make sure all the app's gems are installed. Switch to the app's root directory (presumably /Milliefetch) and run bundle install --without production (you only need to specify --without production the first time, as this setting will be remembered on future runs of Bundler for this project).

$ Bundle install

•	Finally, get the local database created:

$ rake db:migrate 
The rake db:migrate command creates a local development database (following the specifications in config/database.yml) and runs the migrations in db/migrate to create the app's schema. It also creates/updates the file db/schema.rb to reflect the latest database schema. Note: it's important to keep this file under version control.
•	Now insert "seed data" into the database--initial data items that the app needs to run:

$ rake db:seed

The $ rake db:seed RAILS_ENV=’test’  command can populate the test db.