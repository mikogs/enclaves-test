package main

import (
	"io"
	"log"
	"github.com/mdlayher/vsock"
)

func main() {
	l, err := vsock.Listen(5005, nil)
	if err != nil {
		log.Fatal(err)
	}
	defer l.Close()

	c, err := l.Accept()
	if err != nil {
		log.Fatal(err)
	}
	defer c.Close()

	if _, err := io.Copy(c, c); err != nil {
		log.Fatal(err)
	}
}
