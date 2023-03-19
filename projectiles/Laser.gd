extends Area2D

export (int) var speed = 1000
export (int, -1, 1) var vertical_direction = 1
export (int) var damage = 1

func _physics_process(delta):
	global_position.y += vertical_direction * speed * delta
