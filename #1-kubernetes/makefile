#Makefile interface for my webapp
#by gojzdar

ip?=127.0.0.1
service?= hiworld-service
repo ?= n/a



#docker commands
dValidate:
ifneq (repo, "n/a")
	@echo Please set repo. Otherwise, this program cannot publish image to docker hub. Syntax: make <recipe> repo=<your docker repository>
	exit 1
endif


dBuild:
	cd apache && $(MAKE) bimg

dPublish: dBuild
	cd apache && $(MAKE) publish repo=$(repo)

#kubernetes commands

kClearDepl:
	- kubectl delete -n default deployment hi-lorem-dep

kClearService:
	- kubectl delete -n default service hiworld-service

kClearAll: kClearDepl kClearService

kDeploy:
	kubectl apply -f k8s/deployment.yaml

kDeployservice:
	kubectl apply -f k8s/node-port-ser.yaml


kDeployall: kDeploy kDeployservice

kRedeployService: kClearService kDeployservice
kRedeploy: kClearDepl kDeploy
kRedeployAll: kRedeploy kRedeployservice open


kGetServ:
	kubectl get services

kGetPod:
	kubectl get pods --show-labels

kGetDep:
	kubectl get deployments

#helm commands

hClear:
	- helm delete my-release

hDeployProd:
	helm install my-release hiworld-chart --values ./hiworld-chart/prod-values.yaml

hDeployDev:
	helm install my-release hiworld-chart --values ./hiworld-chart/dev-values.yaml

hRedeployProd: hClear hDeployProd open
hRedeployDev: hClear hDeployDev open


#showcase commands

kShowcase: dValidate kClearAll dPublish kDeployall sleep10 open
hShowcase: dValidate hClear dPublish hDeployProd sleep10 open

#misc commands


init:
	open -a docker && sleep 30 && minikube start && minikube dashboard &


showports:
	nmap $(ip) -p0-65535 

checkStatus:
	@cd misc && ./checkConnections.bash

open:
	minikube service $(service)

sleep10:
	sleep 10