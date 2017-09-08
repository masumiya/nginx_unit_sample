# NGINX Unit SAMPLE(PHP & Python)

## Setup

```sh
$ git clone https://github.com/masumiya/nginx_unit_sample.git
$ cd nginx_unit_sample
$ docker build -t nginx_unit_sample .
$ docker run -name nginx_unit_sample -p 8300:8300 -p 8400:8400 nginx_unit_sample
```

## Example URL

### PHP Application

http://localhost:8300/

### Python Application

http://localhost:8400/
