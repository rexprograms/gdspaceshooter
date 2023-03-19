extends Enemy

signal spawn_laser(Laser, location)
var Laser = preload("res://projectiles/EnemyLaser.tscn")
onready var muzzle = $Muzzle


func _on_ShootTimer_timeout():
	emit_signal("spawn_laser", Laser, muzzle.global_position)
