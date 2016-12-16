# Info

An small image of bitcoin base on alpine, it will run bitcoind on start.

---

# Simple

Container port 8333 should expose to public 8333 in order to make it works, if you don't know what your doing, don't change it.

```
docker run -p 8333:8333 szyhf/bitcoin-alpine:latest
```

---

# Valumes

The directory .bitcoin is put in /root/.bitcoin, mount it if you like

```
docker run -p 8333:8333 -v your/path:/root/.bitcoin szyhf/bitcoin-alpine:latest
```

---

# With option

Also you can use all option to bitcoind.

```
docker run -p 8333:8333 szyhf/bitcoin-alpine:latest -OPTION_KEY OPTION_VALUE ......
```

---

# With bitcoin.conf

Just put the bitcoin.conf in the directory you mounted to /root/.bitcoin or just mount the config file

```
docker run -p 8333:8333 -v your/bitcoin.conf:/root/.bitcoin/bitcoin.conf szyhf/bitcoin-alpine:latest
```

---

# About RPC

If you want to use rpc server, and use another container to link it, remeber to set the option "rpcallowip=0.0.0.0/0.0.0.0" either in bitcoin.conf or in args to bitcoind.

Don't change it unless you know what you do, more info please read the document of bitcoin.

```
docker run -l your_bitcoin_container:bitcoin your-server-container
```
