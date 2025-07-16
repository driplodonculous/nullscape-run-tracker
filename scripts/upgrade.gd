extends PanelContainer

var upgrades

@onready var main = get_tree().get_current_scene()
@onready var name_label: Label = $"MarginContainer/Name Label"
@onready var count_label: Label = $"MarginContainer/Count Label"
@onready var margin_container: MarginContainer = $MarginContainer

var label
var count = 0
var max_count = 1
var lvl
var req
var solo = false

var selected = false


func update():
	if count < 0:
		count = 0
	if count == 0:
		upgrades.chosen_upgrades.erase(label)
	else:
		if not upgrades.chosen_upgrades.has(label):
			upgrades.chosen_upgrades.append(label)
	if max_count:
		count_label.text = str(count) + "/" + str(max_count)
	else:
		count_label.text = str(count)
	if max_count and count >= max_count:
		modulate.a = 0.5
		if not get_parent() == upgrades.max_list:
				reparent(upgrades.max_list)
	else:
		modulate.a = 1
		if main.level < lvl or (req and not upgrades.chosen_upgrades.has(req)) or (solo and not main.solo):
			margin_container.modulate = Color(Color.INDIAN_RED)
			if not get_parent() == upgrades.unavailable_list:
				reparent(upgrades.unavailable_list)
		else:
			margin_container.modulate = Color(Color.WHITE)
			if not get_parent() == upgrades.available_list:
				reparent(upgrades.available_list)
	


func _ready() -> void:
	name_label.text = label
	tooltip_text = "Minimum Level: " + str(lvl)
	if req:
		tooltip_text += "\nRequired Upgrade: " + str(req)
	if solo:
		tooltip_text += "\nSolo Exclusive"
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
