sudo service postgresql stop
sudo service postgresql start
bin/rails active_storage:install
<<<<<<< HEAD
#rake db:drop
#rake db:create
rake db:migrate
#rake db:seed
=======
rake db:drop
rake db:create
rake db:migrate
rake db:seed
>>>>>>> 0ea4f98542e2889db7c72c659a55ac5fd6319ed4

sudo bin/rails server -p 80 #-b 172.33.5.74 
