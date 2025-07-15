extends PanelContainer

var curses
var enemies

@onready var main = get_tree().get_current_scene()
@onready var name_label: Label = $"MarginContainer/Name Label"
@onready var margin_container: MarginContainer = $MarginContainer

var label
var lvl
var enemy
var chosen = false

var selected = false


func update():
	if chosen:
		modulate.a = 0.5
		if not get_parent() == curses.chosen_list:
				reparent(curses.chosen_list)
	else:
		modulate.a = 1
		if main.level < lvl or (enemy and not enemies.chosen_enemies.has(enemy)):
			margin_container.modulate = Color(Color.INDIAN_RED)
			if not get_parent() == curses.unavailable_list:
				reparent(curses.unavailable_list)
		else:
			margin_container.modulate = Color(Color.WHITE)
			if not get_parent() == curses.available_list:
				reparent(curses.available_list)


func _ready() -> void:
	name_label.text = label
	main.update.connect(update)
	call_deferred("update")


func _input(event: InputEvent) -> void:
	if selected and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			chosen = not chosen
			update()
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			chosen = not chosen
			update()


func select():
	selected = true


func unselect():
	selected = false
