#/bin/bash



## Install Go Lang
GOLANG=go1.3.3.linux-amd64.tar.gz
#GOLANG=go1.4.1.linux-amd64.tar.gz

wget https://storage.googleapis.com/golang/$GOLANG
tar -xf $GOLANG  && rm $GOLANG
#sudo mv go /usr/local

# install Go tools
export WORK_DIR=`pwd`
export GOPATH=$WORK_DIR
export PATH=$WORK_DIR/go/bin:$GOPATH/bin:$PATH


## Install Go tool
go get golang.org/x/tools/cmd/cover golang.org/x/tools/cmd/vet
#go get code.google.com/p/go.tools/cmd/vet
#go get code.google.com/p/go.tools/cmd/cover

go get -v github.com/mattn/goveralls
go get -v github.com/onsi/ginkgo
go get -v github.com/onsi/gomega
go get -v github.com/apcera/nats
go install -v github.com/onsi/ginkgo/ginkgo
git submodule update --init --recursive

# running tests
./bin/test
# PATH=/usr/local/gopath/bin:$PATH ./bin/test

