extends Label

@onready var main = get_tree().get_current_scene()

var selected = false

func _input(event: InputEvent) -> void:
	if selected and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			toggle()
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			toggle()


func toggle():
	main.hard = not main.hard
	text = "Hard" if main.hard else "Normal"
	main.update.emit()


func select():
	selected = true


func unselect():
	selected = false
