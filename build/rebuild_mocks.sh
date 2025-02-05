#!/bin/bash

set -eux

echo "Regenerate mocks:"

mkdir -p internal/pkg/mocks

items="pool volume"
for i in $items; do
    mockgen -source=internal/pkg/registry/${i}.go \
        -package mocks >internal/pkg/mocks/${i}_mock.go
done

items="job"
for i in $items; do
    mockgen -source=internal/pkg/dacctl/${i}.go \
        -package mocks >internal/pkg/mocks/${i}_mock.go
done

items="disk"
for i in $items; do
    mockgen -source=internal/pkg/fileio/${i}.go \
        -package mocks >internal/pkg/mocks/${i}_mock.go
done

items="interface"
mockgen -source=internal/pkg/pfsprovider/interface.go \
    -package mocks >internal/pkg/mocks/pfsprovider_mock.go
