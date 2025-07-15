extends VSplitContainer

@onready var enemies: VSplitContainer = $"../Enemies"

@onready var available_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Available"
@onready var unavailable_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Unavailable"
@onready var chosen_list: VBoxContainer = $ScrollContainer/VBoxContainer/Chosen

var curse_file = preload("res://scenes/curse.tscn")
var chosen_curses = []
var curses_list = [
	{"label": "Random Spawn", "lvl": 1},
	{"label": "Lower Gravity", "lvl": 1},
	{"label": "Worse Tiles", "lvl": 1},
	{"label": "Savory Ring", "lvl": 1},
	{"label": "Ice Tiles", "lvl": 1},
	{"label": "LAP 2", "lvl": 1, "cant": "Fragile Gifts"},
	{"label": "Fragile Gifts", "lvl": 5, "cant": "LAP 2"},
	{"label": "Bigger Tripmines", "lvl": 5},
	{"label": "More Tripmines", "lvl": 5},
	{"label": "Nearsightedness", "lvl": 5},
	{"label": "Fake Count", "lvl": 8},
	{"label": "Nothing?", "lvl": 5},
	{"label": "Mart Slide", "lvl": 1, "enemy": "Mart"},
	{"label": "Mart Infection", "lvl": 1, "enemy": "Mart"},
	{"label": "More Ringing", "lvl": 1, "enemy": "Bell"},
	{"label": "Closer Skinwalker", "lvl": 1, "enemy": "Skinwalker"},
	{"label": "Conga Line", "lvl": 5, "enemy": "Skinwalker"},
	{"label": "Taller Skinwalker", "lvl": 1, "enemy": "Skinwalker"},
	{"label": "Skinwalker Presence", "lvl": 1, "enemy": "Skinwalker"},
	{"label": "Bigger Blast", "lvl": 8, "enemy": "ICBM"},
	{"label": "Missile Silo", "lvl": 8, "enemy": "ICBM"},
	{"label": "Bloodier Meat", "lvl": 5, "enemy": "Flesh"},
	{"label": "Mass Infection", "lvl": 5, "enemy": "Flesh"},
	{"label": "Muted", "lvl": 8, "enemy": "Telefragger"},
	{"label": "Telestabber", "lvl": 15, "enemy": "Telefragger"},
	{"label": "Pacifier", "lvl": 1, "enemy": "Baby"},
	{"label": "Trap Card", "lvl": 12, "enemy": "ICBM"},
	{"label": "Weaker Jumppads", "lvl": 1},
]

func _ready() -> void:
	for curse in curses_list:
		var scene = curse_file.instantiate()
		scene.label = curse["label"]
		scene.lvl = curse["lvl"]
		if curse.has("enemy"):
			scene.enemy = curse["enemy"]
		if curse.has("cant"):
			scene.cant = curse["cant"]
		scene.curses = self
		scene.enemies = enemies
		add_child(scene)
