# Dockerized bfgminer

[bfgminer](http://bfgminer.org/) is a crypto-currency miner.
If you have found your way here, I assume you know about virtual currencies and mining.

## Tags

* **latest**, **1.0** - normal bfgminer, based on Ubuntu 16.10

## How-To

### Checking device mapping

Default operation is to list the devices recognized by `bfgminer`.
I.e. default options are `-d? -D`. Thus running

```
docker run --device=/dev/<device> --it --rm peron/bfgminer
```

will output a list of the reognized (SHA-) devices, and the container will then shut down and remove itself.
If the devices are scrypt-devices, the container must be started with the correct parameters:

```
docker run --device=/dev/<device> --it --rm peron/bfgminer --scrypt -d? -D
```

Multiple `--device=...` parameters are possible.

### Mining

The container understands all [bfgminer config](https://github.com/luke-jr/bfgminer) options.
They can be passed as parameters after the image name. (See example above.)

The container has a working directory, `/bfgminer`. Mapping a directory containing config files to this directory,
makes starting mining easy:

```
docker run --device=/dev/<device> -v <absolut-path-to-dir-with-config-files>:/bfgminer -it -d peron/bfgminer --config <config-file-name>
```

**NOTE:** This starts the container in detached mode. To first test that the config file works, the container can be started with
the `--rm` option instead of the `-d` option.

Attaching to a detached container can always be done using

```
docker attach <container-name>
```

Default detach key combo is `ctrl-p ctrl-q`.
