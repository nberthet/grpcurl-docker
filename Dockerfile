FROM golang:alpine as gobuild

RUN apk update && apk upgrade
RUN apk add --no-cache git

RUN go get github.com/fullstorydev/grpcurl
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl

FROM alpine:latest

COPY --from=gobuild /go/bin/grpcurl /usr/bin/grpcurl

ENTRYPOINT ["/usr/bin/grpcurl"]
