[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
[![Travis Build Status](https://travis-ci.org/mavogel/hska-vis-legacy.svg?branch=master)](https://travis-ci.org/mavogel/hska-vis-legacy)

# Distributed Information Systems Laboratory aka vis-lab
This project is the quick setup of the legacy webshop of 
the masters course 'Distributed Information Systems' at the University of Applied Sciences (Karlsruhe).

## Table of Contents
- [Prerequisites](#prerequisites)
- [Usage](#usage)
    - [Quick Start](#quick-start)
    - [Built it on your own](#built-it-on-your-own)
- [Notes](#notes)
    - [WindowsSupport](#windows-support)
    - [Travis Support](#travis-support)
    - [Database cleanup](#database-cleanup)
- [License](#license)

## <a name="prerequisites"></a>Prerequisites
- [maven](https://maven.apache.org/)
- [docker](https://docker.com)
- docker-compose

## <a name="usage"></a>Usage
You can run the images from `docker hub` which is preferred or built it on your own.

### <a name="quick-start"></a>Quick Start (docker-hub)
- Start Docker daemon
- Copy the `docker-compose.yml` locally in a desired folder and run
```bash
$ docker-compose up -d
# to follow the logs
$ docker-compose logs -tf
```

### <a name="built-it-on-your-own"></a>Built it on your own
- Start Docker daemon
- Check out the project, export variables and simply run the script:
```bash
$ chmod +x build_and_run.sh
$ ./build_and_run.sh
```
- It builds the web app `war`, packs it into a docker tomcat8 container,
and sets the user `tomcat` with password `admin` for the Management Console at [http://localhost:8888/](http://localhost:8888/)
- Initializes the MySQL Database docker container with the db user defined in `hibernate.cfg.xml`
- Sets up both containers and make the legacy webshop available under [http://localhost:8888/EShop-1.0.0/](http://localhost:8888/EShop-1.0.0/)

## <a name="notes"></a>Notes
### <a name="windows-support"></a>Windows support
This project has not been tested on Windows. Feel free to contribute a `.bat` file.

### <a name="travis-support"></a>Travis support
Add a `$DOCKER_USER` and `$DOCKER_PASS` variable to the travis build if you want CI.

### <a name="database-cleanup"></a>Database Cleanup
If you change the user and password of the MySQL database, you should run
```bash
$ docker-compose -f docker-compose-legacy.yml rm -v
$ rm -rf .data
```
Details can be found [here](https://github.com/docker-library/mysql/issues/51)

## <a name="license"></a>License
    Copyright (c) 2017 Manuel Vogel
    Source code is open source and released under the MIT license.