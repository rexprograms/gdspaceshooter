extends Area2D

class_name Enemy

export (int) var speed = 150
export (int) var hp = 1
export (int) var damage = 1

func _physics_process(delta):
	global_position.y += speed * delta


func _on_Enemy_area_entered(area):
	if area is Player:
		area.take_damage(damage)
		
func take_damage(damage):
	print("enemy take damage")
	hp -= damage
	if hp <= 0:
		queue_free()
