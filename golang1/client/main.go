package main

import (
	"log"
	"fmt"
	"github.com/mdlayher/vsock"
)

func main() {
	c, err := vsock.Dial(17, 5005, nil)
	if err != nil {
		log.Fatal(err)
	}
	defer c.Close()

	if _, err := c.Write([]byte("hello world")); err != nil {
		log.Fatal(err)
	}

	b := make([]byte, 16)
	n, err := c.Read(b)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(string(b[:n]))
}

