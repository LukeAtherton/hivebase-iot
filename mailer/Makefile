.PHONY:	launch

launch:	
	-fleetctl stop mailer.service mailer-register.service; 
	fleetctl unload mailer.service mailer-register.service; 
	-fleetctl destroy mailer.service mailer-register.service;
	fleetctl submit ./systemd/mailer.service; 
	fleetctl submit ./systemd/mailer-register.service; 
	fleetctl start mailer.service mailer-register.service;
	fleetctl journal -f mailer;
