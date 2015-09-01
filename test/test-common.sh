#!/usr/bin/env bash

set -e

README=../README.md
SEMVER=../src/semver
LIBEXECDIR=../lib

function find-commands {
  grep '^    \$ semver' $README | \
    sed -e 's#    \$ semver##'
}

function find-results {
  grep '^    [^a-zA-Z$ ]' $README | \
    grep -v '^    \$ semver' | sed -e 's#^    ##'
}

