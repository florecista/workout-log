## Pull the mysql:5.7 image
FROM mysql:5.7

## The maintainer name and email
MAINTAINER Your Name <name@email.com>

# database = test and password for root = password
ENV MYSQL_DATABASE=workout \
    MYSQL_ROOT_PASSWORD=W0rk0ut!

# when container will be started, we'll have `test` database created with this schema
COPY ./workout.sql /docker-entrypoint-initdb.d/
