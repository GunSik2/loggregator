# GoLang installation

echo "install basic requirements"
sudo apt-get update && upgrade
sudo apt-get install build-essential mercurial git libssl-dev pkg-config tree

echo "download Go and install it, as well as create GOPATH directory"
wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz
tar -xf go1.4.1.linux-amd64.tar.gz && rm go1.4.1.linux-amd64.tar.gz
sudo mv go /usr/local
#sudo mkdir -p /usr/local/gopath
#sudo chown -R ubuntu.ubuntu /usr/local/gopath

#echo "set enviornment variables required for Go"
#export GOROOT=/usr/local/go
#export GOPATH=/usr/local/gopath
#cat <<EOF >> ~/.bashrc
#export GOROOT=/usr/local/go
#export GOPATH=/usr/local/gopath
#export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#EOF
#. ~/.bashrc
#


# install loggregator
git clone https://github.com/cloudfoundry/loggregator
cd loggregator

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
