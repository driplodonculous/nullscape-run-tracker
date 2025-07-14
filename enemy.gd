extends PanelContainer

var upper_list
var lower_list

@onready var name_label: Label = $"MarginContainer/Name Label"
@onready var count_label: Label = $"MarginContainer/Count Label"
@onready var index = get_index()

var label
var count = 0
var max

var selected = false


func update_count():
	if count < 0:
		count = 0
	count_label.text = str(count) + "/" + str(max)
	if count >= max:
		modulate.a = 0.5
		if not get_parent() == lower_list:
			reparent(lower_list)
	else:
		modulate.a = 1
		if not get_parent() == upper_list:
			reparent(upper_list)


func _ready() -> void:
	name_label.text = label
	update_count()

func _input(event: InputEvent) -> void:
	if selected and event is InputEventMouseButton:
		if (event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_WHEEL_UP) and event.pressed:
			count += 1
			update_count()
		elif (event.button_index == MOUSE_BUTTON_RIGHT or event.button_index == MOUSE_BUTTON_WHEEL_DOWN) and event.pressed:
			count -= 1
			update_count()


func select():
	selected = true


func unselect():
	selected = false
