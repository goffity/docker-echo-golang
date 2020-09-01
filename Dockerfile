FROM golang:1.13-alpine as builder

LABEL mantainer="Goffity Corleone"

WORKDIR /echo-golang
COPY . .

RUN go build && go install

FROM alpine
COPY --from=builder /go/bin/echo-golang /go/bin/echo-golang

CMD ["/go/bin/echo-golang"]

