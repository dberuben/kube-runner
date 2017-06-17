package server

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

// Serve starts the api server
func Serve() {
	router := gin.Default()

	v1 := router.Group("/v1")
	{
		v1.GET("/index", indexEndpoint)
	}

	router.Run(":8080")
}

func indexEndpoint(c *gin.Context) {
	message := time.Now().Format("2006-Jan-_2 11:04:05 AM")
	c.String(http.StatusOK, message)
}
