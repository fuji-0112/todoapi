#FROM golang:1.13
FROM golang:1.24.2

WORKDIR /
ENV GOPATH /go

COPY . /go/src/github.com/gihyodocker/todoapi
RUN go mod init github.com/gihyodocker/todoapi
RUN go get github.com/go-sql-driver/mysql
RUN go get gopkg.in/gorp.v1
RUN cd /go/src/github.com/gihyodocker/todoapi && go build -o bin/todoapi cmd/main.go
RUN cd /go/src/github.com/gihyodocker/todoapi && cp bin/todoapi /usr/local/bin/

CMD ["todoapi"]
