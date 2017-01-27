FROM szyhf/golang:1.7.4-alpine3.5

MAINTAINER Back Yu <yhfszb@gamil.com>

RUN go get -fix -v github.com/beego/bee
RUN go get -fix -v github.com/astaxie/beego

# RUN alias bee-pack="bee pack -exs=\".go:.DS_Store:.tmp:.log:.md:.example\" -ss=true"