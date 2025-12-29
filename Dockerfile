FROM rust:slim-trixie AS builder


RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    npm \
    pkg-config \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*;

WORKDIR /app

COPY graphics ./graphics
COPY martin ./martin
COPY martin-core ./martin-core
COPY martin-tile-utils ./martin-tile-utils
COPY mbtiles ./mbtiles
COPY Cargo.toml .

RUN cargo build --release;

FROM debian:trixie-slim
# FROM alpine:3.17

WORKDIR /app

COPY --from=builder /app/target/release/martin ./
COPY --from=builder /app/target/release/martin-cp ./
COPY --from=builder /app/target/release/mbtiles ./

EXPOSE 8053

CMD ["./martin", "--config", "/app/data/config.yaml"]
