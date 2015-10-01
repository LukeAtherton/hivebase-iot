.PHONY:	launch

launch:	
	-fleetctl stop healthchecker.service; 
	fleetctl unload healthchecker.service; 
	-fleetctl destroy healthchecker.service;
	fleetctl submit ./systemd/healthchecker.service; 
	fleetctl start healthchecker.service;
	fleetctl journal -f healthchecker;
