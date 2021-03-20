FROM golang:1.14 AS builder

WORKDIR /go/src

COPY ./src/hello.go .

RUN GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/hello

FROM scratch

COPY --from=builder /go/bin/hello /hello

ENTRYPOINT ["/hello"]