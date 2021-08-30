FROM golang:alpine3.14 as builder

RUN apk add --no-cache upx

ENV CGO_ENABLED=0
WORKDIR /go/src/app
COPY . .

RUN go build -ldflags="-s -w" main.go
RUN upx --brute main
RUN rm main.go

#####################################
FROM busybox:1.24.2
WORKDIR /home
COPY --from=builder /go/src/app/main .
ENTRYPOINT [ "./main" ]