extends Area2D

class_name Player

onready var muzzle = $Muzzle

signal spawn_laser(Laser, player_loc)
signal update_player_hp(amount)

export (int) var speed = 300
export (int) var hp = 3
export (int) var damage = 1

var input_vector = Vector2.ZERO
var Laser = preload("res://projectiles/PlayerLaser.tscn")

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		
	global_position += input_vector * speed * delta
	global_position.x = clamp(global_position.x, 0, 540)
	global_position.y = clamp(global_position.y, 0, 960)
	
	if Input.is_action_just_pressed("shoot"):
		emit_signal("spawn_laser", Laser, muzzle.global_position)


func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(damage)
		
func take_damage(d):
	hp -= d
	emit_signal("update_player_hp", hp)
	if hp <= 0:
		queue_free()	
