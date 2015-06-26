# Docker-Flexget
[Flexget](https://github.com/Flexget/Flexget) in a [Docker](https://github.com/Docker/Docker) container

## Build

`cd` to the cloned git repository, and build the docker container:

    docker build -t YOUR-NAME/flexget .

Put your configuration in `/srv/docker/flexget/`, and then, to run the docker container, you can use the following command: 

    docker run -v /srv/docker/flexget:/config -p 5050:5050 YOUR-NAME/flexget:latest
    
The Web UI will be accessible on port `5050` of your host machine.

#### Disclaimer:

The Web UI is at a very early stage. **It is not stable at all!**

See here if you want to help the flexget project: http://flexget.com/wiki/Contribute

----

![flexget-logo](http://flexget.com/chrome/site/FlexGet.png)
![docker-logo](https://www.docker.com/sites/all/themes/docker/assets/images/logo.png)
