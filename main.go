package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

func main() {
	fmt.Fprintf(os.Stdout, "The server is listening at port 8080")
	err := http.ListenAndServe(":8080", handler())
	if err != nil {
		log.Fatalf("Error occurs: %v", err)
	}
}

func handler() http.Handler {
	r := mux.NewRouter()
	r.HandleFunc("/", helloHandler)
	return r
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello Telesat!")
}
