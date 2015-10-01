.PHONY:	launch

launch:	
	-fleetctl stop authenticator.service authenticator-register.service; 
	fleetctl unload authenticator.service authenticator-register.service; 
	-fleetctl destroy authenticator.service authenticator-register.service;
	fleetctl submit ./systemd/authenticator.service; 
	fleetctl submit ./systemd/authenticator-register.service; 
	fleetctl start authenticator.service authenticator-register.service;
	fleetctl journal -f authenticator;
