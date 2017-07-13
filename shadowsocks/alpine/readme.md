# info

An go-shadowsocks base on alpine.

## notice

Both contains ss-server and ss-local, so didn't set the `CMD`, using `shadowsocks-local {args}` or `shadowsocks-server {args}` to run.

## volumes

The default config is in `/shadowsocks/config.json`, volume if need.

## config example

``` json
{
    "server":"localhost",
    "server_port":12345,
    "local_port":1080,
    "password":"my-passwd",
	"method": "aes-256-cfb",
	"auth": false,
	"port_password":"",
	"timeout":600,
	"server_password":[

	]
}
```

Any of config option has default value, so delete the option if you don't know what is it.

## ss-local

While using ss-local, `config.json` can't define `local address` and using '127.0.0.1' as default, so use `-b` like `shadowsocks-local -b 192.168.1.1` to bind at other address.