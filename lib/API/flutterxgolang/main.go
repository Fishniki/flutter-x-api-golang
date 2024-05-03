package main

import (
	"flutterxgolang/config"
	"flutterxgolang/routes"
	"log"
)

func main() {
	config.Connect()
	log.Println("Database Terkoneksi")

	config.Connect()

	e := routes.Init()
	e.Logger.Fatal(e.Start(":3000"))

}
