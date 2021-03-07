FROM golang:1.16.0-alpine AS build
WORKDIR /
COPY entrypoint.go entrypoint.go
RUN go build entrypoint.go

FROM scratch
WORKDIR /root/
COPY --from=build /entrypoint .
CMD ["./entrypoint"]
