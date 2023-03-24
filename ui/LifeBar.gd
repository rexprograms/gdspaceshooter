extends Control

onready var HP = preload("res://ui/HP.tscn")

var current_hp = 0

var pips = []

func _ready():
	pass # Replace with function body.

func update_hp(amount):
	if amount >= 0:
		var diff = amount - current_hp
		if diff < 0:
			remove_hp_nodes(diff * -1)
		elif diff > 0:
			add_hp_nodes(current_hp, diff)
		current_hp = amount
	
func remove_hp_nodes(amount):
	for i in amount:
		var child = pips.pop_back()
		child.destroy()
		
func add_hp_nodes(current, amount):
	for i in amount:
		var hp = HP.instance()
		var x_position = 30 * (i + current)
		hp.position = Vector2(x_position, 0)
		add_child(hp)
		pips.push_back(hp)
