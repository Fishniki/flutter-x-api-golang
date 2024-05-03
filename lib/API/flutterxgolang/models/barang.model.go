package models

import (
	"flutterxgolang/config"
	"net/http"
)

type Barang struct {
	Id         int    `json:"id"`
	Kodebarang string `json:"kodebarang"`
	Namabarang string `json:"namabarang"`
}

type Response struct {
	Status int `json:"status"`
	Message string `json:"message"`
	Data interface{} `json:"data"`
}


func DataBarang() (Response, error) {
	var obj Barang
	var arrobj []Barang
	var res Response

	con := config.CreateCon()
	sqlquery := "SELECT * FROM `flutterxgo`"

	rows, err := con.Query(sqlquery)


	if err != nil {
		return res, err
	}

	for rows.Next(){
		err = rows.Scan(&obj.Id, &obj.Kodebarang, &obj.Namabarang)
		if err != nil {
			return res, err
		}

		arrobj = append(arrobj, obj)
	}

	res.Status = http.StatusOK
	res.Message = "Suksess"
	res.Data = arrobj

	return res, nil
}

func SimpanData(kodebarang string, namabarang string) (Response, error) {
	var res Response

	con := config.CreateCon()

	sqlquery := "INSERT INTO `flutterxgo` (kode_barang, namabarang) VALUES (?, ?)"

	stmt, err := con.Prepare(sqlquery)
	if err != nil {
		return res, nil
	}

	result, err := stmt.Exec(kodebarang, namabarang)
	if err != nil {
		return res, nil
	} 

	getIdLast, err := result.LastInsertId()
	if err != nil {
		return res, nil
	}

	res.Status = http.StatusOK
	res.Message = "Sukses"
	res.Data = map[string]int64{
		"getIdLast" : getIdLast,
	}

	return res, nil
}

