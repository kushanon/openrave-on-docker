FROM nvidia/opengl:1.0-glvnd-devel-ubuntu14.04

RUN apt-get update &&\
    apt-get install -y apt-file
RUN apt-file update &&\
    apt-file search add-apt-repository 
RUN apt-get install -y software-properties-common 

RUN add-apt-repository -y ppa:personalrobotics/ppa \
    && apt-get update -qq \
    && apt-get install -qq --no-install-recommends pr-openrave \
    && apt-get clean -qq 

RUN apt-get install -y mesa-utils x11-apps\
    && rm -rf /var/lib/apt/lists/*
