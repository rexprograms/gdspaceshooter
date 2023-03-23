extends Area2D

class_name Enemy

signal enemy_died(score)

export (int) var speed = 150
export (int) var hp = 1
export (int) var damage = 1
export (int) var score = 10

func _physics_process(delta):
	global_position.y += speed * delta


func _on_Enemy_area_entered(area):
	if area is Player:
		area.take_damage(damage)
		
func take_damage(d):
	$Hit.play()
	hp -= d
	if hp <= 0:
		emit_signal("enemy_died", score)
		queue_free()
