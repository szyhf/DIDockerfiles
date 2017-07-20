# ShadowsocksR 服务端安装教程 #
### 说明 ###
不建议使用一键脚本安装，除非你自己能维护其功能，否则安装时若出了问题很难查，而且现在有不少不明来历的一键脚本内嵌后门程序。
此教程为单用户版，适合个人用户。如果你是站长，请查看多用户版教程：
[数据库多用户教程](https://github.com/breakwa11/shadowsocks-rss/wiki/Server-Setup(manyuser-with-mysql))
[json版多用户教程](https://github.com/breakwa11/shadowsocks-rss/wiki/Server-Setup(manyuser-with-mudbjson))（仅一台服务器适用）

基本库安装
-----
以下命令均以root用户执行，或sudo方式执行

centos：

    yum install git

ubuntu/debian：

    apt-get install git

获取源代码
-----
`git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git`

执行完毕后此目录会新建一个shadowsocksr目录，其中根目录的是多用户版（即数据库版，个人用户请忽略这个），子目录中的是单用户版(即shadowsocksr/shadowsocks)。

根目录即 ./shadowsocksr

子目录即 ./shadowsocksr/shadowsocks

服务端配置
-----
进入根目录初始化配置(假设根目录在`~/shadowsocksr`，如果不是，命令需要适当调整)：

```shell
cd ~/shadowsocksr
bash initcfg.sh
```

以下步骤要进入子目录：

```shell
cd ~/shadowsocksr/shadowsocks
```

#### 快速运行

```shell
python server.py -p 443 -k password -m aes-256-cfb -O auth_sha1_v4 -o http_simple

#说明：-p 端口 -k 密码  -m 加密方式 -O 协议插件 -o 混淆插件
```

如果要后台运行：

```shell
python server.py -p 443 -k password -m aes-256-cfb -O auth_sha1_v4 -o http_simple -d start
```

如果要停止/重启：

```shell
python server.py -d stop/restart
```

查看日志：

```shell
tail -f /var/log/shadowsocksr.log
```

用 -h 查看所有参数

#### 使用配置文件运行

如果你的ss目录是`~/shadowsocksr`，进入这里
修改`user-config.json`中的`server_port`，`password`等字段，具体可参见：
https://github.com/breakwa11/shadowsocks-rss/wiki/config.json


运行子目录内的server.py：
```
python server.py
```

如果要在后台运行：
```
python server.py -d start
```
如果要停止/重启：
```
python server.py -d stop/restart
```
查看日志：
```
tail -f /var/log/shadowsocksr.log
```
### 更新源代码 ###
如果代码有更新可用本命令更新代码

进入shadowsocksr目录
`cd shadowsocksr`
执行
`git pull`
成功后重启ssr服务

### 自启动

[System startup script](https://github.com/breakwa11/shadowsocks-rss/wiki/System-startup-script)

客户端
------
注：以下客户端中有：
windows客户端和python版客户端，ShadowsocksX-NG（macOS客户端之一），
Android客户端，Shadowrocket（iOS客户端之一，iTunes售价$3美元/￥18人民币），
可以使用SSR特性，

其他原版客户端只能以兼容的方式连接SSR服务器（SSR可兼容SS客户端）。

* [Windows] / [OS X] / [ShadowsocksX-NG]
* [Linux python] / [Linux Qt]
* [Android] / [iOS] / [Shadowrocket]
* [OpenWRT]

OSX上可使用GoAgentX的SSR插件。在你本地的 PC 或手机上使用图形客户端。具体使用参见它们的使用说明。

也可以直接使用 [Python] 版客户端（命令行）。

### 其它加密支持 ###
安装[libsodium]即可支持 salsa20, chacha20, chacha20-ietf 加密（暂不支持[AEAD]）

### 其它异常 ###
如果你的服务端python版本在2.6以下，那么必须更新python到2.6.x或2.7.x版本

其它参见 https://github.com/breakwa11/shadowsocks-rss/wiki/ulimit


[AEAD]:              https://github.com/onelogin/aead
[Android]:           https://github.com/shadowsocksr/shadowsocksr-android
[Debian sid]:        https://packages.debian.org/unstable/python/shadowsocks
[iOS]:               https://github.com/shadowsocks/shadowsocks-iOS/wiki/Help
[libsodium]:         https://github.com/breakwa11/shadowsocks-rss/wiki/libsodium
[Linux python]:      https://github.com/shadowsocksr/shadowsocksr
[Linux Qt]:          https://github.com/librehat/shadowsocks-qt5
[OpenWRT]:           https://github.com/shadowsocks/openwrt-shadowsocks
[OS X]:              https://github.com/shadowsocks/shadowsocks-iOS/wiki/Shadowsocks-for-OSX-Help
[Python]:            https://github.com/breakwa11/shadowsocks-rss/wiki/Python-client-setup-(Mult-language)
[ShadowsocksX-NG]:   https://github.com/yichengchen/ShadowsocksX-R
[Shadowrocket]:      https://itunes.apple.com/us/app/shadowrocket/id932747118
[Windows]:           https://github.com/shadowsocksr/shadowsocksr-csharp

# 配置文件各项说明

各选项说明（注意，你应该修改使用initcfg.sh脚本初始化后的user-config.json）：

Name    |    Explanation  | 中文说明
------- | --------------- | ---------------
server |	the address your server listens | 监听地址
server_ipv6 |   the ipv6 address your server listens  | ipv6地址
server_port |	server port                     | 监听端口
local_address|	the address your local listens  | 本地地址
local_port |	local port                      | 本地端口
password |	password used for encryption    | 密码
timeout |	in seconds                      | 超时时间
udp_timeout |	in seconds                      | UDP链超时时间
udp_cache |	cache size                      | UDP链缓冲区大小
method |	default: "aes-256-cfb", see Encryption | 加密方式
protocol |      default："origin"     | 协议插件，默认"origin"
protocol_param |      default：""     | 协议插件参数，默认""
obfs   |      default："tls1.2_ticket_auth_compatible"     | 混淆插件，默认"tls1.2_ticket_auth_compatible"
obfs_param |      default：""     | 混淆插件参数，默认""
redirect |      default：""     | 重定向参数，默认""
dns_ipv6|     default:false  | 是否优先使用IPv6地址，有IPv6时可开启
fast_open |	use TCP_FASTOPEN, true / false         | 快速打开(仅限linux客户端)
workers	| number of workers, available on Unix/Linux   | 线程（仅限linux客户端）
verbose | display verbose debug info | 显示调试信息
connect_verbose_info | display connection verbose info | 显示连接信息
forbidden_ip | forbidden IP set for outbound | 阻止连接到此IP列表
forbidden_port | forbidden port set for outbound | 阻止连接到此端口列表
ignore_bind | not bind the IP set | 不绑定的IP列表
out_bind | force bind this IPv4 IP | 强制绑定此IPv4地址
out_bindv6 | force bind this IPv6 IP | 强制绑定此IPv6地址
additional_ports | additional ports for multiuser mode | 多用户模式下配置额外端口
speed_limit_per_con | rate limit for each connection | 单连接限速，单位KB
speed_limit_per_user | rate limit for each user | 单用户限速，单位KB

其中各protocol与obfs介绍参见：[混淆插件说明]

注：客户端的protocol和obfs配置必须与服务端的一致，除非服务端配置为兼容插件。

redirect参数说明：

值为空字符串或一个列表，若为列表示例如
"redirect":["bing.com", "cloudflare.com:443"],
作用是在连接方的数据不正确的时候，把数据重定向到列表中的其中一个地址和端口（不写端口则视为80），以伪装为目标服务器。

dns_ipv6参数说明：

为true则指定服务器优先使用IPv6地址。仅当服务器能访问IPv6地址时可以用，否则会导致有IPv6地址的网站无法打开。

一般情况下，只需要修改以下五项即可：
```
"server_port":8388,        //端口
"password":"password",     //密码
"protocol":"origin",       //协议插件
"obfs":"http_simple",      //混淆插件
"method":"aes-256-cfb",    //加密方式
```

## 多端口配置

如果要多个用户一起使用的话，请写入以下配置：

```javascript
{
    "server":"0.0.0.0",
    "server_ipv6": "[::]",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
        "80":"password1",
        "443":"password2"
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "protocol": "auth_sha1_compatible",
    "protocol_param": "",
    "obfs": "http_simple_compatible",
    "obfs_param": "",
    "redirect": "",
    "dns_ipv6": false,
    "fast_open": false,
    "workers": 1
}
```
按照格式修改端口和密码：
```
    "port_password":{
        "80":"password1",       //端口和密码1
        "443":"password2"       //端口和密码2
    },
```

如果要为每个端口配置不同的混淆协议，请写入以下配置：

```javascript
{
    "server":"0.0.0.0",
    "server_ipv6":"::",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
        "8388":{"protocol":"auth_simple", "password":"abcde", "obfs":"http_simple", "obfs_param":""},
        "8389":{"protocol":"origin", "password":"abcde"}
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "protocol": "auth_sha1_compatible",
    "protocol_param": "",
    "obfs": "http_simple_compatible",
    "obfs_param": "",
    "redirect": "",
    "dns_ipv6": false,
    "fast_open": false,
    "workers": 1
}
```
按格式修改端口、密码以及混淆协议。也可以和以前的格式混合使用，如果某个端口不配置混淆协议，则会使用下面的默认"obfs"配置。

[混淆插件说明]:        https://github.com/breakwa11/shadowsocks-rss/wiki/obfs
