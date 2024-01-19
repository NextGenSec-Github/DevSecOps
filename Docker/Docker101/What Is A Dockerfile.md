# What is a Dockerfile?

A Dockerfile is a script or a set of instructions used to build a Docker image. Docker images are lightweight, standalone, and executable packages that include everything needed to run a piece of software, including the code, runtime, libraries, and system tools.

## Purpose

The primary purpose of a Dockerfile is to define the steps and commands required to create a Docker image. It serves as a blueprint for building containerized applications, ensuring consistency and reproducibility across different environments.

## Key Components

### Base Image

A Dockerfile typically starts with a base image. This is the starting point for building your application. It can be a minimalistic image, like Alpine Linux, or an image with a specific runtime and dependencies.

```dockerfile
FROM ubuntu:20.04
```

## Instructions

Dockerfiles consist of a series of instructions, each representing a step in the image-building process. Some common instructions include:

`RUN: Executes commands in the image.`

`COPY and ADD: Copies files from the host machine to the image.`

`WORKDIR: Sets the working directory for subsequent instructions.`

`EXPOSE: Informs Docker that the container will listen on specified network ports at runtime.`

`CMD and ENTRYPOINT: Specify the command to run when the container starts.`
