.PHONY:launch deploy

launch:	
	-fleetctl stop mongodb.service mongodb-register.service; 
	fleetctl unload mongodb.service mongodb-register.service; 
	-fleetctl destroy mongodb.service mongodb-register.service;
	fleetctl submit ./systemd/mongodb.service; 
	fleetctl submit ./systemd/mongodb-register.service; 
	fleetctl start mongodb.service mongodb-register.service;
	fleetctl journal -f mongodb;

deploy:
	make launch;