FROM rust:1.92-alpine

LABEL "name"="Automate publishing Rust build artifacts for GitHub releases through GitHub Actions"
LABEL "version"="1.4.5-fix-xz"
LABEL "repository"="http://github.com/Lucky2307/rust-build.action"
LABEL "maintainer"="Douile <25043847+Douile@users.noreply.github.com>"

# Add regular dependencies
RUN apk add --no-cache curl jq git build-base bash zip tar xz xz-static zstd upx dbus-dev pkgconf

# Add windows dependencies
RUN apk add --no-cache mingw-w64-gcc

COPY entrypoint.sh /entrypoint.sh
COPY build.sh /build.sh
COPY common.sh /common.sh

RUN chmod 555 /entrypoint.sh /build.sh /common.sh

ENTRYPOINT ["/entrypoint.sh"]
