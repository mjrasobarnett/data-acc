#!/bin/bash

set -eu -o pipefail

make
#make test

export ETCDCTL_ENDPOINTS=127.0.0.1:2379
export ETCDCTL_API=3

echo
echo run tests:
./bin/amd64/etcd-keystore-func-test

echo
echo see side effects:
etcdctl get --prefix ""
