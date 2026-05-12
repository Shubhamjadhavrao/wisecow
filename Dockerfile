FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat-openbsd \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

# Create writable working directory with correct permissions
RUN mkdir -p /wisecow && chmod 777 /wisecow

WORKDIR /wisecow

COPY wisecow.sh .

# Fix line endings AND make executable
RUN sed -i 's/\r//' wisecow.sh && \
    chmod +x wisecow.sh

EXPOSE 4499
CMD ["bash", "wisecow.sh"]
