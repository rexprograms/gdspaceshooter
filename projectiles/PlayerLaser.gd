extends "res://projectiles/Laser.gd"

func _on_PlayerLaser_area_entered(area):
	print("player laser hit")
	if area.is_in_group("enemies"):
		area.take_damage(damage)
		queue_free()
