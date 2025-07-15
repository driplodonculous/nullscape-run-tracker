extends Label

@onready var main: Control = $"../../.."

var selected = false

func _input(event: InputEvent) -> void:
	if selected and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			main.level += 1
			text = "Level " + str(main.level)
			main.update.emit()
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			main.level -= 1
			if main.level < 1:
				main.level = 1
			text = "Level " + str(main.level)
			main.update.emit()


func select():
	selected = true


func unselect():
	selected = false
