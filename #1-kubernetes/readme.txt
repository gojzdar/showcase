Requirements:
1. Linux / Unix shell
2. Software:
- docker desktop
- kubernetes
- minikube

Process:

Navigate to root of the directory downloaded from github

1. If docker and minikube haven't been started yet:
    make init

2. edit the root makefile, so that the repo makefile variable, declared at line #6
    repo=<your dockerhub repo[/path/within/repositorty]>

3. Build docker image, publish it to your docker repo and deploy a kubernetes cluster with helm with productions settings
    make hShowcase

4. If you want to take down the kubernetes cluster created with helm, use
    make hClear

5. Alternatively, you can just deploy a dev/prod helm template.
5.1 If there is no running helm template:
    make hDeployProd
    or
    make hDeployDev
5.2 If there isn't, you can run: (you can run this even if there is already a helm template cluster deployed through my project)
    make hRedeployProd
    or
    make hRedeployDev

6. Clear the helm template cluster
    make hClear