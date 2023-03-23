extends Control

onready var HP = preload("res://ui/HP.tscn")

var current_hp = 0

func _ready():
	pass # Replace with function body.

func update_hp(amount):
	var diff = amount - current_hp
	if diff < 0:
		remove_hp_nodes(current_hp, diff * -1)
	elif diff > 0:
		add_hp_nodes(current_hp, diff)
	current_hp = amount
	
func remove_hp_nodes(current, amount):
	var start_index = current - 1
	for i in range(start_index, start_index-amount, -1):
		var child = get_child(i)
		child.destroy()
		
func add_hp_nodes(current, amount):
	for i in amount:
		var hp = HP.instance()
		var x_position = 30 * (i + current)
		hp.position = Vector2(x_position, 0)
		add_child(hp)
