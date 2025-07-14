extends Control

signal update

func update_all():
	update.emit()
