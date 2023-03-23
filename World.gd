extends Node2D

onready var HUD = $HUD
onready var player = $Player
onready var EnemyContainer = $EnemyContainer
var score = 0

func _ready():
	score = 0
	update_hud()
	
func enemy_died(_score):
	score += _score
	update_hud()
	
func update_hud():
	HUD.update_score(score)
	HUD.update_hp(player.hp)

func spawn_laser(Laser, location):
	var laser = Laser.instance()
	laser.global_position = location
	add_child(laser)

func spawn_enemy(EnemyScene, location):
	print("Spawning enemy...")
	var enemy = EnemyScene.instance()
	enemy.global_position = location
	EnemyContainer.add_child(enemy)
	enemy.connect("enemy_died", self, "enemy_died")
	if enemy.has_signal("spawn_laser"):
		enemy.connect("spawn_laser", self, "spawn_laser")
	
func _on_Player_update_player_hp(amount):
	HUD.update_hp(amount)

