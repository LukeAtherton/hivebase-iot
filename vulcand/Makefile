.PHONY:	launch deploy

launch:	
	-fleetctl stop vulcand.service; 
	fleetctl unload vulcand.service; 
	-fleetctl destroy vulcand.service;
	fleetctl start ./systemd/vulcand.service; 

deploy:
	make launch;