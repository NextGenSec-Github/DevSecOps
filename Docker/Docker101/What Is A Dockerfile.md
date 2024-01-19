# What is a Dockerfile?

A Dockerfile is a script or a set of instructions used to build a Docker image. Docker images are lightweight, standalone, and executable packages that include everything needed to run a piece of software, including the code, runtime, libraries, and system tools.

## Purpose

The primary purpose of a Dockerfile is to define the steps and commands required to create a Docker image. It serves as a blueprint for building containerized applications, ensuring consistency and reproducibility across different environments.

## Key Components

### Base Image

A Dockerfile typically starts with a base image. This is the starting point for building your application. It can be a minimalistic image, like Alpine Linux, or an image with a specific runtime and dependencies.

```dockerfile
FROM ubuntu:20.04
