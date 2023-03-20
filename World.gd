extends Node2D

onready var HUD = $HUD
var score = 0

func _ready():
	score = 0
	update_hud()
	
func enemy_died(_score):
	score += _score
	update_hud()
	
func update_hud():
	HUD.update_score(score)

func spawn_laser(Laser, location):
	var laser = Laser.instance()
	laser.global_position = location
	add_child(laser)

func spawn_enemy(EnemyScene, location):
	var enemy = EnemyScene.instance()
	enemy.global_position = location
	add_child(enemy)
	enemy.connect("enemy_died", self, "enemy_died")
	if enemy.has_signal("spawn_laser"):
		enemy.connect("spawn_laser", self, "spawn_laser")
	
