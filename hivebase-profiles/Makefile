.PHONY:	launch

launch:	
	-fleetctl stop hivebase-profiles.service hivebase-profiles-register.service; 
	fleetctl unload hivebase-profiles.service hivebase-profiles-register.service; 
	-fleetctl destroy hivebase-profiles.service hivebase-profiles-register.service;
	fleetctl submit ./systemd/hivebase-profiles.service; 
	fleetctl submit ./systemd/hivebase-profiles-register.service; 
	fleetctl start hivebase-profiles.service hivebase-profiles-register.service;
	fleetctl journal -f hivebase-profiles;
