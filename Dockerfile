# Selecting golang as the base image
FROM golang

# Creating a Directory to store hello-openshift.go and binary
RUN mkdir openshift-ramp-up-session-1

# Copying hello-openshift.go to above directory
COPY hello-openshift.go openshift-ramp-up-session-1/

# Building binary from hello-openshift.go
RUN go build -o openshift-ramp-up-session-1/hello-openshift openshift-ramp-up-session-1/hello-openshift.go

# Setting binary of hello-openshift.go as entrypoint
ENTRYPOINT ["./openshift-ramp-up-session-1/hello-openshift"]
