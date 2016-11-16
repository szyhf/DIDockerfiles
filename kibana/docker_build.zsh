#!/bin/zsh

# docker build -t --rm szyhf/kibana:v1

# docker run --name kibana --link elastic_search:elasticsearch -p 5601:5601 -d szyhf/kibana