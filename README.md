# workout-log

### Commands to build and start the MySQL server

Edit path and details where appropriate.

```
cd backend
docker build -t workout-mysql .
docker run -d \
--publish 6603:3306 \
--volume=/Users/<user-login>/Projects/workout-log/server/data:/var/lib/mysql \
--name=workout-mysql workout-mysql
```

### Commands to build and start the NodeJS server

```
cd ../middle
docker build -t workout-nodejs .
docker run -d \
--publish 4000:4000 \
-e MYSQL_USER='root' \
-e MYSQL_PASSWORD='W0rk0ut!' \
-e MYSQL_DATABASE='workout' \
-e MYSQL_HOST='172.17.0.2' \
--link workout-mysql:db \
--name=workout-nodejs workout-nodejs
```

### Commands to test the client / server integration

```
# Get index page
curl -X GET localhost:4000
{"success":true,"message":"Hello world"}

# Get options for First Dropdown
curl -X POST localhost:4000/get-movements   
{"success":true,"result":[{"id":1,"parent_id":null,"name":"Set Up","description":null},{"id":2,"parent_id":null,"name":"Standing","description":null},{"id":3,"parent_id":null,"name":"Top Position","description":null},{"id":4,"parent_id":null,"name":"Bottom Position","description":null}]}

# Get options for Second Dropdown
curl -X POST localhost:4000/get-components/1
{"success":true,"result":[{"id":5,"parent_id":1,"name":"Punch","description":null},{"id":6,"parent_id":1,"name":"Push","description":null},{"id":7,"parent_id":1,"name":"Pull","description":null},{"id":8,"parent_id":1,"name":"Press","description":null},{"id":9,"parent_id":1,"name":"Pass","description":null},{"id":10,"parent_id":1,"name":"Post","description":null},{"id":11,"parent_id":1,"name":"Pump Fake","description":null},{"id":12,"parent_id":1,"name":"Wrist Peel","description":null},{"id":13,"parent_id":1,"name":"Wrist Control","description":null},{"id":14,"parent_id":1,"name":"Snap Down Single Post","description":null},{"id":15,"parent_id":1,"name":"Snap Down Double Post","description":null},{"id":16,"parent_id":1,"name":"Change Level under Single Post","description":null},{"id":17,"parent_id":1,"name":"Change Level under Double Post","description":null},{"id":18,"parent_id":1,"name":"Collar Tie","description":null},{"id":19,"parent_id":1,"name":"Inside Tie","description":null},{"id":20,"parent_id":1,"name":"Elbow Pass","description":null},{"id":21,"parent_id":1,"name":"Slide By","description":null}]}
```
