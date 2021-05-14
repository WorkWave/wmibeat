package main

import (
	"os"

	"github.com/elastic/beats/v7/libbeat/cmd"
	"github.com/elastic/beats/v7/libbeat/cmd/instance"
	"github.com/workwave/wmibeat/beater"
)

var RootCmd = cmd.GenRootCmdWithSettings(beater.New, instance.Settings{Name: "wmibeat"})

func main() {
	if err := RootCmd.Execute(); err != nil {
		os.Exit(1)
	}
}
