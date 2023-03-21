extends Control

func _ready():
	pass # Replace with function body.

func update_hp(amount):
	remove_hp_nodes()
	add_hp_nodes(amount)
	
func remove_hp_nodes():
	for n in get_children():
		remove_child(n)
		n.queue_free()
		
func add_hp_nodes(amount):
	for i in amount:
		var spr = Sprite.new()
		spr.texture = load("res://assets/player-life.png")
		spr.scale = Vector2(.7,.7	)
		var x_position = spr.texture.get_width() * i + 10
		spr.position = Vector2(x_position, 0)
		add_child(spr)
