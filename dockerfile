FROM erlang:22.2.1-alpine
RUN apk add --no-cache git && apk add --no-cache make
COPY . /app/
WORKDIR /app
ADD https://s3.amazonaws.com/rebar3/rebar3 /usr/local/bin/
RUN chmod +x /usr/local/bin/rebar3
RUN make compile
EXPOSE 8080
ENTRYPOINT  make start