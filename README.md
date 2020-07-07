# benramsey/pennmush

[![Source Code][badge-source]][source]
[![Latest Version][badge-release]][release]
[![Software License][badge-license]][license]
[![Docker Build][badge-build]][build]
[![Total Downloads][badge-downloads]][downloads]

[benramsey/pennmush][] is a [Docker][] image for [PennMUSH][].

This project adheres to a [Contributor Code of Conduct][conduct]. By
participating in this project and its community, you are expected to uphold this
code.


## Getting/Updating the Image

To get or update the benramsey/pennmush image, use the `pull` command:

```bash
docker pull benramsey/pennmush
```

This will always pull the image tagged as `latest`. If you would like to pull
an image with a specific tag, specify the tag when pulling:

```bash
docker pull benramsey/pennmush:188p0
```


## Running PennMUSH

To run benramsey/pennmush, specify a host port to proxy to `4201` on the running
container, and map a directory on the host to the `/mush/game` directory
on the container.

For example:

```bash
docker run -d \
    -p 4201:4201 \
    -v "/path/to/host/game/dir:/mush/game" \
    benramsey/pennmush:188p0
```

The first time you run the image, the container will create database and
configuration files in `/path/to/host/game/dir`. You may edit these files
according to your needs.

*You should customize `mush.cnf` for your particular MUSH.*

### Connecting for the first time

You may use any [MU\* client][clients] to connect to PennMUSH. Telnet also works:

```bash
telnet localhost 4201
```

The first time you connect to PennMUSH, use the username `One` and password
`one`. This is your MUSH "god" account, so be sure to change the password.

```
<This is where you announce that they've connected to your MUSH>
<It's a good idea to include the version/patchlevel of MUSH you're running>
<It's a good idea to include an email address for questions about the MUSH>
-----------------------------------------------------------------------------
Use create <name> <password> to create a character.
Use connect <name> <password> to connect to your existing character.
Use 'ch <name> <pass>' to connect hidden, and cd to connect DARK (admin)
Use QUIT to logout.
Use the WHO command to find out who is online currently.
-----------------------------------------------------------------------------
Yell at your local god to personalize this file!

> connect One one


Welcome to PennMUSH!
--------------------------------------------------------------------------
Yell at your god to personalize this file

Wizards, tell your friendly neighborhood god to personalize this file!


Last connect was from 127.0.0.1 on Wed Feb 20 04:27:09 2019.


MAIL: You have no mail.

Room Zero(#0RL)
You are in Room Zero.

> @password one=mynewpassword
```

### Getting help

Type `help` to get a menu of help commands.

```
> help

This is the index to the MUSH online help files.

  For an explanation of the help system, type:    help newbie
  For a walkthrough of PennMUSH systems, type:    help getting started

  For the list of MUSH commands, type:            help commands
  For the list of MUSH topics, type:              help topics
  For an alphabetical list of all help entries:   help entries
  For information about PennMUSH:                 help code

  For a list of flags:                            help flag list
  For a list of functions:                        help function list
  For a list of attributes:                       help attribute list
  To see the configuration of this MUSH:          @config

  Use 'help <pattern>' to search for topic names that match the wildcard pattern
  <pattern>, or 'help/search <pattern>' for a list of topics whose text matches
  <pattern> (See HELP SEARCHING for details on the format of the pattern).

  On many MUSHes, list local commands with:       +help

  If there are any errors in the help text, please notify a wizard in the game,
  or file an issue at https://github.com/pennmush/pennmush/issues, which is the
  bug-tracking site for PennMUSH (and its distributed help files) but probably
  has no relation to this MUSH in particular.
```

### Reboot and shutdown

Any time you make changes to configuration files, you need to reboot PennMUSH
in order to reload the configuration files. You can do this while either
connected to the MUSH through a client or Telnet, or you may send a reboot
command through Docker to the running container.

While connected to PennMUSH using a MU\* client, you may reboot/reload with the
`@shutdown/reboot` command:

```
> @shutdown/reboot

GAME: Reboot w/o disconnect by One, please wait.
GAME: Saving database. Game may freeze for a few moments.
GAME: Save complete.
GAME: Reboot finished.
```

If you wish to reboot PennMUSH without connecting to a client, you may do so by
sending a command to the Docker container. First, find the ID or name of the
running container with `docker ps`. Then, send it a reboot command:

```bash
docker exec 3148b63e67d1 reboot
```

To dump data to the database and shutdown PennMUSH, use the `@shutdown` command
while connected using a MU\* client:

```
> @shutdown

GAME: Shutdown by One
Going down - Bye
Connection closed by foreign host.
```

Or you may send the `shutdown` command to the Docker container:

```bash
docker exec 3148b63e67d1 shutdown
```


## Contributing

Contributions are welcome! Please read [CONTRIBUTING][] for details.


## Copyright and License

The benramsey/pennmush Docker image is copyright © [Ben Ramsey](https://benramsey.com)
and licensed for use under the MIT License (MIT). Please see [LICENSE][] for
more information.


[benramsey/pennmush]: https://hub.docker.com/r/benramsey/pennmush
[docker]: https://www.docker.com
[pennmush]: https://www.pennmush.org
[conduct]: https://github.com/ramsey/docker-pennmush/blob/master/.github/CODE_OF_CONDUCT.md
[clients]: https://en.wikipedia.org/wiki/MUD_client
[contributing]: https://github.com/ramsey/docker-pennmush/blob/master/.github/CONTRIBUTING.md

[badge-source]: http://img.shields.io/badge/source-benramsey/pennmush-blue.svg?style=flat-square
[badge-release]: https://img.shields.io/github/release/ramsey/docker-pennmush.svg?style=flat-square
[badge-license]: https://img.shields.io/github/license/ramsey/docker-pennmush.svg?style=flat-square
[badge-build]: https://img.shields.io/docker/cloud/automated/benramsey/pennmush.svg?style=flat-square
[badge-downloads]: https://img.shields.io/docker/pulls/benramsey/pennmush.svg?style=flat-square&colorB=mediumvioletred

[source]: https://github.com/ramsey/docker-pennmush
[release]: https://github.com/ramsey/docker-pennmush/releases
[license]: https://github.com/ramsey/docker-pennmush/blob/master/LICENSE
[build]: https://hub.docker.com/r/benramsey/pennmush
[downloads]: https://hub.docker.com/r/benramsey/pennmush
