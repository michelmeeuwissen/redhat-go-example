package main

import (
	"log"
	"net/http"
)

func main() {
	_, err := http.Get("https://www.google.com")
	if err != nil {
		log.Printf("Error during Get is: %s", err) // throw 509
	} else {
		log.Printf("Call is done")
	}
}
