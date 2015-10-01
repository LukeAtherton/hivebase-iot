.PHONY:	dev-stack-launch ha-stack-launch db-launch mq-launch proxy-launch healthchecker-launch

dev-stack-launch:	
	(cd stack && make dev-build);
	(cd stack && make dev-launch);

ha-stack-launch:	
	(cd stack && make dev-build);
	(cd stack && make dev-launch);

db-launch:	
	(cd mongodb && make deploy);

mq-launch:	
	(cd rabbitmq && make deploy);

proxy-launch:	
	(cd vulcand && make deploy);

healthchecker-launch:
	(cd healthchecker && make launch);