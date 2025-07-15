extends PanelContainer

var enemies

@onready var main = get_tree().get_current_scene()
@onready var name_label: Label = $"MarginContainer/Name Label"
@onready var count_label: Label = $"MarginContainer/Count Label"
@onready var margin_container: MarginContainer = $MarginContainer

var label
var count = 0
var max_count
var lvl
var last

var selected = false


func update():
	if count < 0:
		count = 0
	if count == 0:
		enemies.chosen_enemies.erase(label)
	else:
		if not enemies.chosen_enemies.has(label):
			enemies.chosen_enemies.append(label)
	if max_count:
		count_label.text = str(count) + "/" + str(max_count * (2 if main.hard else 1))
	else:
		count_label.text = str(count)
	if max_count and count >= max_count * (2 if main.hard else 1):
		modulate.a = 0.5
		if not get_parent() == enemies.max_list:
				reparent(enemies.max_list)
	else:
		modulate.a = 1
		if main.level < lvl or (last and main.level > last):
			margin_container.modulate = Color(Color.INDIAN_RED)
			if not get_parent() == enemies.unavailable_list:
				reparent(enemies.unavailable_list)
		else:
			margin_container.modulate = Color(Color.WHITE)
			if not get_parent() == enemies.available_list:
				reparent(enemies.available_list)
	


func _ready() -> void:
	name_label.text = label
	tooltip_text = "Minimum Level: " + str(lvl)
	if last:
		tooltip_text += "\nMaximum Level: " + str(last)
	main.update.connect(update)
	call_deferred("update")


func _input(event: InputEvent) -> void:
	if selected and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			count += 1
			main.update.emit()
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			count -= 1
			main.update.emit()


func select():
	selected = true


func unselect():
	selected = false
