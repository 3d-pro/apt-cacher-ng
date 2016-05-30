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
