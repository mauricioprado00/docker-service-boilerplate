# Starting the server

```
docker-compose up theservice
```

# sending a command

## stopping the server
```
docker-compose exec  theservice /app/send.sh quit
```

## sending other command
e.g. ping
```
docker-compose exec  theservice /app/send.sh ping some information
```