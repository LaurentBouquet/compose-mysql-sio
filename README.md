


```
cp .env.example .env
MYSQL_PORT=33060 COMPOSE_PROJECT_NAME=mysql1 MYSQL_PASSWORD=azerty docker-compose up -d 
mysql -h 127.0.0.1 -u sio -P 33060 -p
```

In this example, the sio password is : azerty




### Thanks to

https://www.docker.com/

https://www.mysql.com/

https://packages.debian.org/src:wait-for-it





