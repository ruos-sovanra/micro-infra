#!/bin/bash

REPO_PATH=$1

if [[ -z "$REPO_PATH" ]]; then
  echo "Usage: $0 <repository-path>"
  exit 1
fi

# Check for Spring files
if [[ -f "$REPO_PATH/pom.xml" ]] || [[ -f "$REPO_PATH/build.gradle" ]]; then
  echo "Spring Microservice"
  exit 0
fi

# Check for React/Next.js (package.json with dependencies)
if [[ -f "$REPO_PATH/package.json" ]]; then
  if grep -q '"react"' "$REPO_PATH/package.json"; then
    echo "React Project"
    exit 0
  elif grep -q '"next"' "$REPO_PATH/package.json"; then
    echo "Next.js Project"
    exit 0
  fi
fi

# Default case
echo "Unknown Project Type"
