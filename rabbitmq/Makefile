.PHONY:launch deploy

launch:	
	-fleetctl stop rabbit-mq.service rabbit-mq-register.service; 
	fleetctl unload rabbit-mq.service rabbit-mq-register.service; 
	-fleetctl destroy rabbit-mq.service rabbit-mq-register.service;
	fleetctl submit ./systemd/rabbit-mq.service; 
	fleetctl submit ./systemd/rabbit-mq-register.service; 
	fleetctl start rabbit-mq.service rabbit-mq-register.service;
	fleetctl journal -f rabbit-mq;

deploy:
	make launch;