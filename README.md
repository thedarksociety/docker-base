Base Images for the DSCR
========================

### Description

Alpine, debian, and python base images for extending and customizing personal applications.

> Base images. Base Image. Bake me a Base Image.


## TL;DR

```sh
$ docker run --name base [image]
```


## Facts

 * Version 0.1
 * [Repository on GitHub](https://github.com/thedarksociety/docker-base)
 

Getting Started
---------------

Placeholder.


### Requirements

 * [Git](https://git-scm.org)
 * [Docker](http://docker.io)


### Supported Versions

 * [`alpine`, (Dockerfile)](link)
 * [`debian`, (Dockerfile)](link)
 * [`python`, (Dockerfile)](link)


Usage
-----

### Features

 * Alpine is configured to run my Go projects
 * Debian is configured to run my PHP, JS projects
 * Python is configured to run my Python projects
 
 
### Pulling the Image

```sh
$ docker pull gcr.io/darksociety-containers/base:[tag]
```


### Environment

| Package | Description |
| ------- | ----------- |
| bash | Bash packeage. |
| sudo | For obvious reasons.|


### Scripts

| Script | Description |
| ------- | ----------- |
| docker-entrypoint.sh | Configuration and initiation for the container. |
| docker-healthcheck.sh |Confirm the container is running and in a health state.|


Developers
---------

**Rye Miller**
 * [Github](https://github.com/iods)
 * [Homepage](http://ryemiller.io)
 * [@ryemiller](http://twitter.com/ryemiller)

**Tiffany Creamer**
 * [Github](https://github.com/tnondairy)


Changelog
---------

### [2021-01-21]
  * Merged the iods/base and thedarksociety/base container repos.
  * Update the README description information.

### [2020-11-27]
  * Added new tests for GitHub Actions.
  * Added build actions for deploying to GCR.

### [2020-11-26]
  * New Alpine, Debian, and Python images.
 

Known Issues
------------

Any known issues can be viewed or added on [GitHub](https://github.com/thedarksociety/docker-base/issues).


Versioning
----------

For transparency into the release cycle and in striving to maintain backwards compatibility, this project is
maintained under [the Semantic Versioning Guidelines](http://semver.og).


Acknowledgements
----------------

  * Huge shout out to @tnondairy for always being my support.


Copyright
---------

Copyright (c) 2020-2021 Rye Miller
