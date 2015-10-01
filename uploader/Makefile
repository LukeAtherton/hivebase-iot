.PHONY:	launch

launch:	
	-fleetctl stop uploader.service uploader-register.service; 
	fleetctl unload uploader.service uploader-register.service; 
	-fleetctl destroy uploader.service uploader-register.service;
	fleetctl submit ./systemd/uploader.service; 
	fleetctl submit ./systemd/uploader-register.service; 
	fleetctl start uploader.service uploader-register.service;
	fleetctl journal -f uploader;
