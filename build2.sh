#/bin/bash

echo `pwd`

# install Go tools
export GOPATH=`pwd`
go get -v golang.org/x/tools/cmd/vet
go get -v golang.org/x/tools/cmd/cover
#go get code.google.com/p/go.tools/cmd/vet
#go get code.google.com/p/go.tools/cmd/cover

go get -v github.com/mattn/goveralls
go get -v github.com/onsi/ginkgo
go get -v github.com/onsi/gomega
go get -v github.com/apcera/nats
go get -v github.com/onsi/ginkgo/ginkgo
git submodule update --init --recursive

# running tests
bin/test
