# Node alpine as base image
FROM node:8-alpine

# Install required dependencies
RUN apk add --no-cache python3 \
                    py3-pip

# Install requirements
RUN pip3 install awscli==1.16.127

# Remove un-necessary package
RUN apk del py3-pip