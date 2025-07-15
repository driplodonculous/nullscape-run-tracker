extends Control

signal update

var level = 1
var hard = false


func update_all():
	update.emit()


func _on_hard_mode_toggled(toggled_on: bool) -> void:
	hard = toggled_on
	update.emit()
