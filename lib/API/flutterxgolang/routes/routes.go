package routes

import (
	"flutterxgolang/controller"
	"net/http"

	"github.com/labstack/echo/v4"
)

func Init() *echo.Echo {
	e := echo.New()

	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hallo Aku Niki")
	})

	e.GET("/barang", controller.DataAll)

	e.POST("/barang/upload", controller.SimpanControllers)
	return e

}
