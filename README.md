# What is xmr-node-proxy 

[xmr-node-proxy](https://github.com/Snipa22/xmr-node-proxy) is a Monero stratum protocol proxy. xmr-node-proxy is written in node and is extremely lightweight. It can easily be deployed on a T2.Micro instance on AWS and handçe up to 2000 connections. 

## How to use this image


- Launch a container:

    In order to function, the proxy needs a [`config.json`](https://github.com/Snipa22/xmr-node-proxy/blob/master/config_example.json) file properly configure and present in its app directory. 

    - Create the appropriate `config.json` file
    - Launch a container with the previously created config file

            docker container run -v $(pwd)/config.json:/app/config.json -p PORT:PORT [-p PORTn:PORTn] --name proxy -d palobo/xmr-node-proxy

        **Where:** PORT is the port you configured in your `config.json` in the `listeningPorts` object. If you have multiple ports simply add as many `-p PORT:PORT` parameters as needed.

- Check the logs:

    docker container logs -f proxy


## Donations

If you'd like to thank my work in dockerizing veriumMiner, donations are accepted in a number of currencies:

- BTC: `1GKzyV59tiW6gLUd9DKTcGqE15g9UUr2EL`
- ETH: `0x1F72BFc6fCDF120706417E4610327742b7169eB6`
- LTC: `LWwu11R6SyMKDdWF8b3wNv6CMw1WHMriDP`
