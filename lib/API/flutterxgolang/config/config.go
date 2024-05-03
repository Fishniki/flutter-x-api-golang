package config

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/tkanos/gonfig"
)

type Configuration struct {
	DB_USERNAME string
	DB_PASSWORD string
	DB_PORT     string
	DB_HOST     string
	DB_NAME     string
}

func GetConfig() Configuration {
	conf := Configuration{}
	gonfig.GetConf("config/config.json", &conf)
	return conf
}

var db *sql.DB  
var err error

func Connect() {
	conf := GetConfig()
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", conf.DB_USERNAME, conf.DB_PASSWORD, conf.DB_HOST, conf.DB_PORT, conf.DB_NAME)

	db, err = sql.Open("mysql", dsn)
	if err != nil {
		panic("Koneksi terdapat error")
	}

	err = db.Ping()
	if err != nil {
		panic("Ping Error")
	}

}

func CreateCon() *sql.DB{
	return db
}
