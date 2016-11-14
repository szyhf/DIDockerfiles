I find that's something wrong with gitolite base on Ubuntu image, and I can't slove it, so I made this CentOS version.

This project is the centos version of : https://github.com/sitaramc/gitolite

Using Example:

```
# build image
docker build -t szyhf:gitolite .

# create container
docker create \
-e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" \
-v /application/gitolite/repositories:/home/git/repositories \
--name gitolite \
szyhf:gitolite
```
It works.
