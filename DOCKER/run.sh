#! /bin/bash

export TMREPO=github.com/tendermint/tendermint
export TMHEAD=master
mkdir -p $GOPATH/src/$TMREPO
cd $GOPATH/src/$TMREPO
git clone https://$TMREPO.git .
git fetch
git reset --hard $TMHEAD
go get -d $TMREPO/cmd/tendermint
make
#build test application
go get github.com/tendermint/tmsp/cmd/dummy
go get github.com/tendermint/merkleeyes/cmd/merkleeyes
go get github.com/tendermint/tmsp/cmd/...
