# Dockerfile for for a moleculer REPL console client for connecting to running service clouds.
#
# Needs to be run on the same network as the target

# Our base image
FROM node:erbium-alpine
# Add maintainer info
LABEL maintainer="ujwal.setlur@gmail.com"

# Add moleculer
RUN npm -g install moleculer-cli

# Add all supported transporters except kafka
RUN npm -g install \
  amqp \
  nats \
  node-nats-streaming \
  ioredis \
  mqtt \
  amqplib \
  rhea-promise

# Add all supported serializers
RUN npm -g install \
  avsc \
  msgpack5 \
  notepack.io \
  protobufjs \
  thrift

# Our entrypoint
ENTRYPOINT ["moleculer"]