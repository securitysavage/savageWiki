## Prerequisites
1. ```docker```(1)
2. ```docker-compose```(2)
3. Whatever else your OS needs for the above (read the docs!). I used Ubuntu 18.04 LTS.
4. That squishy stuff between your ears.

## Installation

1. Clone the repo: ```git clone https://github.com/securitysavage/savagewiki.git```
2. Edit ```docker-compose.yml``` and change the mySQL user and password values.
3. Edit ```savagescript.sql``` and modify the database name and username to reflect the changes you made in the yml (if any).
4. Make sure you are in the same directory as the yml, then run: ```docker-compose up -d```(3)
5. Once it completes, navigate to ```localhost:8080``` and go through the MediaWiki installation process (documented in the links below). Use the hostname for your database image (my default is ```savagewiki_database_1:3306```).
6. When configuration is complete, it will prompt you to save ```LocalSettings.php```. Save it to the folder where you cloned this repo, and uncomment line 21 in your ```docker-compose.yml``` to tell ```docker``` to mirror your config to the MediaWiki container(4). ```LocalSettings.example``` is included for your reference.
7. Restart your containers with ```docker-compose down``` followed by ```docker-compose up -d```.
8. Log in to your wiki with the administrative account you set up during installation, and start populating your wiki. For portability, back up the docker volumes and your ```LocalSettings.php``` to drop in anywhere you deploy it.

## Notes/Links

Based on [this blog](https://kalifornia909.info/post/media-wiki-docker/) and [this one](https://peppe8o.com/personal-mediawiki-with-raspberry-pi-and-docker/).

(1) Docs for all platforms at https://docs.docker.com/engine/install/, Linux installation walkthrough [here](https://davidbarszczak.com/index.php/2020/03/02/install-docker-on-ubuntu-18-04/).

(2) Docs for all platforms at https://docs.docker.com/compose/install/, Linux installation walkthrough [here](https://davidbarszczak.com/index.php/2020/03/03/install-docker-compose-on-ubuntu-18-04/).

(3) If ```docker-compose up -d``` times out, the command ```COMPOSE_HTTP_TIMEOUT=200 docker-compose up -d``` is a useful workaround (or just retry the command).

(4) For step 6, make sure the hyphen in ```- ./LocalSettings.php:/var/www/html/LocalSettings.php``` lines up with the ```- mediawiki-www:/var/www/html``` entry when you uncomment it, or MediaWiki will not see your configuration.

Tested and working on Ubuntu and MacOS.
