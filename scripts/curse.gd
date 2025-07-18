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
var cant
var req
var important = false

var selected = false


func update_chosen():
	if not chosen:
		curses.chosen_curses.erase(label)
	else:
		if not curses.chosen_curses.has(label):
			curses.chosen_curses.append(label)

func update():
	if chosen:
		modulate.a = 0.5
		if not get_parent() == curses.chosen_list:
				reparent(curses.chosen_list)
	else:
		modulate.a = 1
		if main.level < lvl or (enemy and not enemies.chosen_enemies.has(enemy) and not enemies.chosen_enemies.has("Shadow " + enemy)) or (cant and curses.chosen_curses.has(cant)) or (req and not curses.chosen_curses.has(req)):
			margin_container.modulate = Color(Color.INDIAN_RED)
			if not get_parent() == curses.unavailable_list:
				reparent(curses.unavailable_list)
		else:
			if not get_parent() == curses.available_list:
				reparent(curses.available_list)
			if main.level == lvl and important:
				margin_container.modulate = Color(Color.YELLOW)
				get_parent().move_child(self, 0)
			else:
				margin_container.modulate = Color(Color.WHITE)


func _ready() -> void:
	name_label.text = label
	tooltip_text = "Minimum Level: " + str(lvl)
	if enemy:
		tooltip_text += "\nRequired Enemy: " + str(enemy)
	if cant:
		tooltip_text += "\nIncompatible With: " + str(cant)
	if req:
		tooltip_text += "\nRequired Curse: " + str(req)
	main.update.connect(update)
	call_deferred("update")


func _input(event: InputEvent) -> void:
	if selected and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			chosen = not chosen
			update_chosen()
			main.update.emit()
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			chosen = not chosen
			update_chosen()
			main.update.emit()


func select():
	selected = true


func unselect():
	selected = false
