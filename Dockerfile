# Use Ubuntu 17.10 docker image
FROM ubuntu:17.10

# Only for the Dockerfile, contact DTU for software questions
MAINTAINER Michael Klitgaard, michael@klitgaard.dk

# Get CL_Mann_x64bit.zip from HAWC2 website
ENV MANN_DOWNLOAD_URL http://www.hawc2.dk/-/media/Sites/hawc2/HAWC2%20Download/Pre-processing%20Tools/CL_Mann_x64bit.ashx
 
ENV BUILD_PACKAGES \
    unzip \
    curl

WORKDIR /opt/mann_turb_x64
COPY mann_turb_x64.sh .

RUN apt-get -qq update &&\
    apt-get -qq install -y  $BUILD_PACKAGES &&\
    apt-get -qq install --no-install-recommends -y wine64 &&\
    curl -o mann_turb_x64.zip $MANN_DOWNLOAD_URL &&\
    unzip mann_turb_x64.zip &&\
    rm mann_turb_x64.zip && \
    apt-get -qq purge -y $BUILD_PACKAGES &&\
    apt-get -qq autoremove -y &&\
    rm -rf /var/lib/apt/lists/* &&\
    mkdir /root/.wine &&\
    mkdir /tmp/mann_calc
