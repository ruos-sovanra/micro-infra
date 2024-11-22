#!/bin/bash

REPO_PATH=$1

if [[ -z "$REPO_PATH" ]]; then
  echo "Usage: $0 <repository-path>"
  exit 1
fi

# Check for Spring-specific files
if [[ -f "$REPO_PATH/pom.xml" ]] || [[ -f "$REPO_PATH/build.gradle" ]]; then
  echo "Spring Microservice detected."
else
  echo "Not a Spring Microservice."
fi

# Check for Dockerfile
if [[ -f "$REPO_PATH/Dockerfile" ]]; then
  echo "Dockerfile found."
else
  echo "Dockerfile not found."
fi
