package controller

import (
	"flutterxgolang/models"
	"net/http"

	"github.com/labstack/echo/v4"
)

func DataAll(c echo.Context) error {

	result, err := models.DataBarang()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"message" : err.Error()})
	}

	return c.JSON(http.StatusOK, result)
}

func SimpanControllers(c echo.Context) error {
	kodebarang := c.FormValue("kodebarang")
	namabarang := c.FormValue("namabarang")

	result, err := models.SimpanData(kodebarang, namabarang)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"messager" : err.Error()})
	}
	return c.JSON(http.StatusOK, result)
}