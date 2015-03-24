#/bin/bash

go_version=1.4

## Install Go Lang
DIR=$(pwd)

cd $HOME
curl -sL -o gimme https://raw.githubusercontent.com/meatballhat/gimme/master/gimme
chmod +x gimme
./gimme $go_version > go_env.sh
source ./go_env.sh

cd $DIR


echo "GOPATH=$(pwd)"
export GOPATH=$(pwd)
export PATH=$GOPATH/bin:$PATH


## Install Go tool
go get golang.org/x/tools/cmd/cover golang.org/x/tools/cmd/vet
#go get code.google.com/p/go.tools/cmd/vet
#go get code.google.com/p/go.tools/cmd/cover

go get -v github.com/mattn/goveralls
go get -v github.com/onsi/ginkgo
go get -v github.com/onsi/gomega
go get -v github.com/apcera/nats
go get -v github.com/apcera/gnatsd
go install -v github.com/onsi/ginkgo/ginkgo
git submodule update --init --recursive

# running tests
./bin/test

