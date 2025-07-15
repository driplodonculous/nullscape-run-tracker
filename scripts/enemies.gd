extends VSplitContainer

@onready var available_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Available"
@onready var unavailable_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Unavailable"
@onready var max_list: VBoxContainer = $ScrollContainer/VBoxContainer/Max

var enemy_file = preload("res://scenes/enemy.tscn")
var chosen_enemies = []
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
	{"label": "Random", "lvl": 8},
]

func _ready() -> void:
	for enemy in enemies_list:
		var scene = enemy_file.instantiate()
		scene.label = enemy["label"]
		if enemy.has("max"):
			scene.max_count = enemy["max"]
		scene.lvl = enemy["lvl"]
		scene.enemies = self
		add_child(scene)
