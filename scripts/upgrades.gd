extends VSplitContainer

@onready var enemies: VSplitContainer = $"../Enemies"

@onready var available_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Available"
@onready var unavailable_list: VBoxContainer = $"ScrollContainer/VBoxContainer/Unavailable"
@onready var max_list: VBoxContainer = $ScrollContainer/VBoxContainer/Max

var upgrade_file = preload("res://scenes/upgrade.tscn")
var chosen_upgrades = []
var upgrades_list = [
	{"label": "Better Jumppads", "lvl": 3},
	{"label": "Defuse Kit", "max": 3, "lvl": 3},
	{"label": "Swiftness Ring", "max": 3, "lvl": 3},
	{"label": "Paycheck", "max": 5, "lvl": 3},
	{"label": "Business License", "lvl": 3},
	{"label": "Gift ESP", "lvl": 3},
	{"label": "Double Jump", "lvl": 3},
	{"label": "Grace Wings", "lvl": 3},
	{"label": "Enemy ESP", "lvl": 3},
	{"label": "Ice Skates", "lvl": 5},
	{"label": "Tripmine ESP", "lvl": 5},
	{"label": "Ninja Belt", "lvl": 13},
	{"label": "Advanced Gravity Coil", "lvl": 8},
	{"label": "Matrix Tetrahedron", "lvl": 15},
	{"label": "Shield", "lvl": 15},
	{"label": "Real Wings", "lvl": 20},
	{"label": "Pocket Bell", "lvl": 8, "req": "Double Jump"},
	{"label": "Sport Shoes", "lvl": 15},
	{"label": "Gift Magnet", "lvl": 15},
	{"label": "Adrenaline", "lvl": 3},
	{"label": "Subspacial Barrier", "lvl": 12},
	{"label": "Grapple Points", "lvl": 10},
]

func _ready() -> void:
	for upgrade in upgrades_list:
		var scene = upgrade_file.instantiate()
		scene.label = upgrade["label"]
		scene.lvl = upgrade["lvl"]
		if upgrade.has("max"):
			scene.max_count = upgrade["max"]
		if upgrade.has("req"):
			scene.req = upgrade["req"]
		scene.upgrades = self
		add_child(scene)
