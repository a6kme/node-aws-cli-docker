# Node alpine as base image
FROM node:16.8.0@sha256:a303645c99378ec8784ce683ec9d7fe4efbb771eb43fc90953ffd0768b556e97

RUN apt-get update
RUN apt-get install -y python3-pip

# Install requirements
RUN pip3 install awscli==1.16.127

# Remove python3-pip
RUN apt-get remove -y python3-pip
