extends Control

signal update

var level = 1

func update_all():
	update.emit()
