#!/bin/bash

wget https://cloud.debian.org/images/cloud/bookworm/20240201-1644/debian-12-generic-amd64-20240201-1644.qcow2
qemu-img resize debian-12-generic-amd64-20240201-1644.qcow2 +10G

