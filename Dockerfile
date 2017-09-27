FROM ubuntu:17.04

MAINTAINER Simone Roberto Nunzi "simone.roberto.nunzi@gmail.com"

# Install required software
RUN apt-get update && apt-get install -y sudo git wget genisoimage bc squashfs-tools xorriso tar klibc-utils iproute2 dosfstools rsync unzip findutils iputils-ping grep

# Install required packages for kernel building
RUN apt-get install -y build-essential libncurses5-dev libssl-dev libelf-dev

# Download repository
RUN git clone https://github.com/stockmind/gpd-pocket-ubuntu-respin.git ./gpd-pocket-ubuntu-respin

RUN mkdir /docker-input
RUN mkdir /docker-output

COPY ./docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
