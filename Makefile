FUNC_NAME=test 
REGISTRY=ghcr.io/cannavit/knative-func-hello
NAMESPACE=default


create:
	func create -l python ${FUNC_NAME}

setup:
	pyenv local 3.12
	python -m venv ./${FUNC_NAME}/venv && source \
	./${FUNC_NAME}/bin/activate

activate:
	source ./${FUNC_NAME}/venv/bin/activate

install-deps: 
	cd ${FUNC_NAME} && pip install -r requirements.txt

run-func-local: 
	cd ${FUNC_NAME} && ./app.sh 

run-test-local:
	cd ${FUNC_NAME} && python test_func.py 

curl-app:
	curl http://localhost:8080/?message=hello 
	
auth-knative:
	docker login https://ghcr.io/v2/knative/

build:
	cd ${FUNC_NAME} && func build --registry=${REGISTRY}

deploy: 
	echo "Generate token from github to authenticate"
	cd ${FUNC_NAME} && func deploy --namespace=${NAMESPACE} --registry=${REGISTRY} 

invoke:
	cd ${FUNC_NAME} && func invoke
