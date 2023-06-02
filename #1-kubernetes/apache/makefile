#Docker handler
#by gojzdar

imgname ?= hw1
imgpath ?= .
contname ?= cont
contport ?= 8080:80
repo ?= n/a #parent makefile provides this

all: bimg run
allc: clean all


validate:
ifneq (repo, "n/a")
	@echo Please set repo. Otherwise, this program cannot publish image to docker hub. Syntax: make <recipe> repo=<your docker repository>
	exit 1
endif


bimg: #build image
	docker build -t $(imgname):latest $(imgpath) 

run: #run container
	docker run --name $(contname) -p $(contport) $(imgname)

clean:
	docker container rm  $(contname)

publish: validate bimg
	docker login && docker tag $(imgname):latest $(repo)/$(imgname):latest && docker image push $(repo)/$(imgname):latest