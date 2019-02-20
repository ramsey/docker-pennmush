ARG debian_tag="9.6-slim"
FROM debian:${debian_tag}

ENV GAME_DIR="/mush/game"

# Install dependencies.
RUN set -ex \
    && export DEBIAN_FRONTEND=noninteractive \
    && mkdir -p /usr/share/man/man1 \
    && mkdir -p /usr/share/man/man7 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        autoconf \
        binutils-dev \
        build-essential \
        ca-certificates \
        ed \
        gawk \
        gettext \
        git \
        gperf \
        icu-devtools \
        libc6-dev \
        libevent-dev \
        libgettextpo-dev \
        libgnutls28-dev \
        libicu-dev \
        libidn2-0-dev \
        libldap2-dev \
        libmariadbclient-dev \
        libmariadbclient-dev-compat \
        libnghttp2-dev \
        libpcre3-dev \
        libpq-dev \
        libpsl-dev \
        libsqlite3-dev \
        libssh2-1-dev \
        libssl-dev \
        libuptimed-dev \
        locales-all \
        mariadb-client \
        perl-base \
        pkg-config \
        postgresql-client \
        sendmail \
        wamerican \
        zlib1g-dev

# Build a custom version of cURL.
ARG curl_version="7.64.0"
RUN set -ex \
    && curl -L -o /tmp/curl-${curl_version}.tar.gz https://curl.haxx.se/download/curl-${curl_version}.tar.gz \
    && apt-get remove -y curl \
    && apt-get autoremove -y \
    && cd /tmp && tar zxf curl-${curl_version}.tar.gz && cd /tmp/curl-${curl_version} \
    && ./configure \
        --prefix=/usr \
        --enable-ipv6 \
        --with-gnutls \
        --with-ldap \
        --with-ldaps \
        --with-libidn2 \
        --with-libssh2 \
        --with-nghttp2 \
        --with-zlib \
    && make \
    && make install \
    && ldconfig

# Install PennMUSH.
ARG pennmush_version="187p0"
RUN set -ex \
    && adduser --disabled-password --gecos '' mush \
    && mkdir -p /mush && chown mush.mush /mush \
    && su -c 'git clone https://github.com/pennmush/pennmush.git /mush' mush \
    && su -c 'cd /mush && git checkout ${pennmush_version}' mush \
    && su -c 'cd /mush \
        && \
        CFLAGS=-Wno-pragmas \
        SENDMAIL=/usr/sbin/sendmail \
        ./configure \
            --enable-ssl_slave \
            --enable-nls \
            --with-pcre' mush \
    && su -c 'cd /mush \
        && make update all install \
        && make portmsg' mush \
    && su -c 'mv /mush/game /mush/game.original' mush

WORKDIR /mush

COPY *.sh /usr/bin/

RUN set -ex \
    && ln -s /usr/bin/reboot.sh /usr/bin/reboot \
    && ln -s /usr/bin/reboot.sh /usr/bin/restart \
    && ln -s /usr/bin/shutdown.sh /usr/bin/shutdown

ENTRYPOINT ["entrypoint.sh"]
