FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    python3.9 \
    python3.9-dev \
    python3.9-venv \
    python3-pip \
    git \
    openjdk-11-jre-headless \
    build-essential \
    nano


RUN mkdir -p /redbot
ENV VIRTUAL_ENV=/redbot
RUN python3.9 -m venv ${VIRTUAL_ENV}
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

RUN python3.9 -m pip install -U pip setuptools wheel && \
    python3.9 -m pip install -U Red-DiscordBot==3.4.17

# VOLUME ["/root/.local/share/Red-DiscordBot/data/", "/root/.config/Red-DiscordBot/"]

COPY run.sh /
ENTRYPOINT [ "/run.sh" ]
CMD []