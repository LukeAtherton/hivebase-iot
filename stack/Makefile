.PHONY:	build launch dev-build dev-launch

build:	
	cat hivebase-stack.yml | ruby -ryaml -rjson -e 'print YAML.load(STDIN.read).to_json' | tee hivebase-stack.json

dev-build:	
	cat dev-stack.yml | ruby -ryaml -rjson -e 'print YAML.load(STDIN.read).to_json' | tee dev-stack.json

launch:	
	discovery=$$(curl -s http://discovery.etcd.io/new?size=3); \
	aws cloudformation create-stack \
	--profile hivebase \
    --stack-name hivebase \
    --template-body file://hivebase-stack.json \
    --parameters \
        ParameterKey=DiscoveryURL,ParameterValue="$$discovery" \
        ParameterKey=InstanceType,ParameterValue=m3.medium \
        ParameterKey=KeyPair,ParameterValue=hivebase-infra

dev-launch:	
	discovery=$$(curl -s http://discovery.etcd.io/new?size=1); \
	aws cloudformation create-stack \
	--profile hivebase \
    --stack-name hivebase-dev \
    --template-body file://dev-stack.json \
    --parameters \
        ParameterKey=DiscoveryURL,ParameterValue="$$discovery" \
        ParameterKey=InstanceType,ParameterValue=m3.medium \
        ParameterKey=KeyPair,ParameterValue=hivebase-infra