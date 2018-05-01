FROM golang


#RUN git clone --depth=50 https://github.com/kalw/oauth2_proxy.git /tmp/bitly/oauth2_proxy
ADD . /tmp/bitly/oauth2_proxy/
RUN mkdir -p $GOPATH/src/github.com/bitly/oauth2_proxy/
RUN apt-get update && apt-get install -y rsync
RUN rsync -av /tmp/bitly/oauth2_proxy/ /go/src/github.com/bitly/oauth2_proxy/
WORKDIR /go/src/github.com/bitly/oauth2_proxy/
RUN go get -t -v ./...
#RUN curl -s https://github.com/golang/dep/releases/download/v0.3.2/dep-linux-amd64 > dep
#RUN wget -O dep https://github.com/golang/dep/releases/download/v0.3.2/dep-linux-amd64
#RUN chmod +x ./dep
#RUN ./dep ensure
RUN go build

EXPOSE 4180
