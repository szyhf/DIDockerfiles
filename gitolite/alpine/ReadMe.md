# 说明

这个是Alpine版的gitolite，镜像更小。

实现时主要参考了：https://hub.docker.com/r/elsdoerfer/gitolite/

## 简单说明

使用本镜像时要区分是否是第一次创建仓库，还是通过volume的方式挂载已有的仓库，否则会覆盖已有的仓库（以git的形式，所以还是可以找回来的，但很麻烦）

### 第一次安装

```
docker run -e SSH\_KEY="$(cat ~/.ssh/id_rsa.pub)" szyhf/gitolite-alpine
```

### 使用已有的仓库

```
docker run -v /your/local/repositories:/home/git/repositories
```

### ENV

#### SSH_KEY

如果传入该变量，表示是第一次安装使用，请传入完整的有效的公钥，这个公钥会被作为默认的admin.pub。

#### TRUST_HOSTS

将该host插入known_hosts文件，目前只能插入一个。


#### GIT_CONFIG_KEYS

会被写入到gitolite.rc的GIT\_CONFIG_KEYS属性。

#### LOCAL_CODE

会被写入到gitolite.rc的LOCAL_CODE属性。

### VOLUMN

#### /home/git/repositories

默认的仓库路径。

#### /etc/ssh

SSH host keys存储的地方，如果不挂载，每次系统自动生成的ssh指纹不一样，重用的时候会出现指纹与HOST:PORT不匹配的情况（就是记录在客户机known_host中的指纹）。

#### /home/git/.ssh

挂载这个目录可以控制每次容器创建时git账户的私钥、公钥和known_host。