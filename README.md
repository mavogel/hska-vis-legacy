[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
[![Travis Build Status](https://travis-ci.org/mavogel/hska-vis-legacy.svg?branch=master)](https://travis-ci.org/mavogel/hska-vis-legacy)

# Distributed Information Systems Laboratory aka vis-lab
This project is the quick setup of the legacy webshop of 
the masters course 'Distributed Information Systems' at the University of Applied Sciences (Karlsruhe).

## Prerequisites
- [maven](https://maven.apache.org/)
- [docker](https://docker.com)
- docker-compose

## Build and start
- Start Docker daemon
- Check out the project, export variables and simply run the script:
```bash
$ chmod +x build_and_run.sh
$ ./build_and_run.sh
```
- Builds the web app `war`, packs it into a docker tomcat8 container,
and sets the user `tomcat` with password `admin` for the Management Console at [http://localhost:8888/](http://localhost:8888/)
- Inits the MySQL Database docker container with the db user defined in `hibernate.cfg.xml`
- Sets up both containers and make the legacy webshop available under [http://localhost:8888/EShop-1.0.0/](http://localhost:8888/EShop-1.0.0/)

## Notes
### Windows support
This project has not been tested on Windows. Feel free to contribute a `.bat` file.

### Travis support
Add a `$DOCKER_USER` and `$DOCKER_PASS` variable to the travis build if you want CI.

### Database
If you change the user and password of the MySQL database, you should run
```bash
$ docker-compose -f docker-compose-legacy.yml rm -v
$ rm -rf .data
```
Details can be found [here](https://github.com/docker-library/mysql/issues/51)
