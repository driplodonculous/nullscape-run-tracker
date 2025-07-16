extends Control

signal update

var level = 1
var hard = false
var solo = false

func update_all():
	update.emit()
