FROM ubuntu:16.10

MAINTAINER peron <per.junel@gmail.com>

RUN apt-get update && \
    apt-get install -y \
      bfgminer

WORKDIR /bfgminer

ENTRYPOINT ["bfgminer"]
CMD ["-d?", "-D"]
