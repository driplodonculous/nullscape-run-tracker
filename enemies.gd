extends VSplitContainer

@onready var upper_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Upper Enemy List"
@onready var lower_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Lower Enemy List"

var enemy_file = preload("res://enemy.tscn")

var enemies_list = [
	{"label": "Bell", "max": 1, "lvl": 1},
	{"label": "Mart", "max": 1, "lvl": 1},
	{"label": "Skinwalker", "max": 3, "lvl": 1},
	{"label": "Baby", "max": 2, "lvl": 1},
	{"label": "ICBM", "max": 2, "lvl": 1},
	{"label": "Flesh", "max": 2, "lvl": 5},
	{"label": "Nil", "max": 1, "lvl": 5},
	{"label": "Shadow Baby", "max": 1, "lvl": 10},
	{"label": "Telefragger", "max": 1, "lvl": 8},
	{"label": "Voidbreaker", "max": 1, "lvl": 10},
	{"label": "Ponderer", "max": 1, "lvl": 15},
	{"label": "Guardian", "max": 2, "lvl": 5},
	{"label": "Shadow Guardian", "max": 1, "lvl": 20},
	{"label": "Random", "max": 1, "lvl": 8},
]

func _ready() -> void:
	for enemy in enemies_list:
		var scene = enemy_file.instantiate()
		scene.label = enemy["label"]
		scene.max = enemy["max"]
		scene.upper_list = upper_list
		scene.lower_list = lower_list
		upper_list.add_child(scene)
