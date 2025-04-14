FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends unzip ca-certificates usbmuxd libimobiledevice6 libimobiledevice-utils libavahi-compat-libdnssd-dev curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/ && \
    mkdir app

WORKDIR /app/

COPY get-latest-files.sh .

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN ./get-latest-files.sh && \
    rm get-latest-files.sh

ENV sonolus="Sonolus_0.8.12.ipa"

RUN curl -#O "https://download.sonolus.com/${sonolus}"

COPY docker-entrypoint.sh .

ENTRYPOINT ["./docker-entrypoint.sh"]
