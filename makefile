
PROGRAM = docker

build:
	$(PROGRAM) build -t openrave . 

run:
	chmod +x ~/.Xauthority
	$(PROGRAM) run --runtime nvidia -it --security-opt label=disable -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/root/.Xauthority --security-opt seccomp=unconfined --privileged --device /dev/dri --net host --env DISPLAY=$(DISPLAY)  --env QT_X11_NO_MITSHM=1 -t openrave /bin/bash

clean:
	$(PROGRAM) rm `$(PROGRAM) ps -aq`
