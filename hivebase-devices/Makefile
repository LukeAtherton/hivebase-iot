.PHONY:	launch

launch:	
	-fleetctl stop hivebase-devices.service hivebase-devices-register.service; 
	fleetctl unload hivebase-devices.service hivebase-devices-register.service; 
	-fleetctl destroy hivebase-devices.service hivebase-devices-register.service;
	fleetctl submit ./systemd/hivebase-devices.service; 
	fleetctl submit ./systemd/hivebase-devices-register.service; 
	fleetctl start hivebase-devices.service hivebase-devices-register.service;
	fleetctl journal -f hivebase-devices;
