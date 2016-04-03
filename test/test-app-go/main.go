package main

import (
	"fmt"
	"html"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Hello, world.")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("processing htp request.")
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
