#/bin/bash

# install Go tools
export GOPAHT=`pwd`
go get golang.org/x/tools/cmd/vet
go get golang.org/x/tools/cmd/cover

go get -v github.com/mattn/goveralls
go get -v github.com/onsi/ginkgo
go get -v github.com/onsi/gomega
go get -v github.com/apcera/nats
go install -v github.com/onsi/ginkgo/ginkgo
git submodule update --init --recursive

# running tests
bin/test
