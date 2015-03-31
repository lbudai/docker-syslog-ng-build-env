#!/bin/bash -e

git clone https://github.com/balabit/syslog-ng

cd syslog-ng

./autogen.sh

./configure \
 --with-ivykis=internal \
 --with-libmongo-client=internal \
 --enable-all-modules \
 --disable-sun-streams \
 --enable-shared \
 --enable-dynamic-linking \
 --with-python=2.7 && \

make

make dist
