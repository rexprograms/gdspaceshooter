extends Node2D

func _on_Player_spawn_laser(Laser, location):
	var laser = Laser.instance()
	laser.global_position = location
	add_child(laser)


func _on_ShootingEnemy_spawn_laser(Laser, location):
	var laser = Laser.instance()
	laser.global_position = location
	add_child(laser)
