# Apt Cacher NG image [![Build Status](https://travis-ci.org/3d-pro/apt-cacher-ng.svg?branch=master)](https://travis-ci.org/3d-pro/apt-cacher-ng)

## Build
```
  docker build -t apt-cacher-ng:latest .
```

## Run
```
  docker run -d -p 3142:3142 -h apt-cacher-ng --name apt-cacher-ng apt-cacher-ng:latest
```

## Run with compose
```
  docker-compose up -d
```
