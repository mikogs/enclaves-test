#!/bin/bash

export VMN=3
export IMAGE=debian-12-generic-amd64-20240201-1644.qcow2
qemu-system-x86_64 \
    -device vhost-vsock-pci,id=vhost-vsock-pci0,guest-cid=${VMN} \
    -smp sockets=1,cpus=4,cores=2 -cpu host \
    -m 1024 \
    -enable-kvm \
    -vga none -nographic \
    -drive file="$IMAGE",if=virtio,aio=threads,format=qcow2 \
    -drive file=seed.img,if=virtio,format=raw \
    -netdev user,id=mynet0,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=mynet0 \
    -debugcon file:debug.log -global isa-debugcon.iobase=0x402 $@


    #-smbios type=1,serial=ds='nocloud;s=http://145.239.84.196:8000/' \

    #-netdev user,id=mynet0,hostfwd=tcp::${VMN}0022-:22,hostfwd=tcp::${VMN}2375-:2375 \

echo "Now connect to localhost:2222 with your SSH key"

