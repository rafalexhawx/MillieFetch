sudo service postgresql stop
sudo service postgresql start
bin/rails active_storage:install
rake db:drop
rake db:create
rake db:migrate
rake db:seed

sudo bin/rails server -p 80 #-b 172.33.5.74 
