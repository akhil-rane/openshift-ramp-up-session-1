# Selecting golang as the base image
FROM golang AS builder

# Creating a Directory to store hello-openshift.go and binary
RUN mkdir openshift-ramp-up-session-1

# Copying hello-openshift.go to above directory
COPY hello-openshift.go openshift-ramp-up-session-1/

# Building binary from hello-openshift.go
RUN go build -o openshift-ramp-up-session-1/hello-openshift openshift-ramp-up-session-1/hello-openshift.go

# Doing multi-stage build so as to keep only hello-openshift binary and avoid other artifacts from golang image
# Selecting ubi8 as base image 
FROM ubi8

# Creating a Directory to store hello-openshift.go binary
RUN mkdir openshift-ramp-up-session-1

# Copying binary from previous build stage to current build stage
COPY --from=builder go/openshift-ramp-up-session-1/hello-openshift openshift-ramp-up-session-1/

# Setting binary of hello-openshift.go as entrypoint
ENTRYPOINT ["./openshift-ramp-up-session-1/hello-openshift"]
