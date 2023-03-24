extends Node2D

onready var GAMEOVER = preload("res://ui/GameOverMenu.tscn")
onready var HUD = $UILayer/HUD
onready var player = $Player
onready var EnemyContainer = $EnemyContainer
onready var EnemySpawner = $EnemyContainer/EnemySpawner
onready var Explosion = $EffectsLayer/Explosion

var score = 0

func _ready():
	score = 0
	HUD.update_score(score)
	HUD.update_hp(player.hp)
	
func enemy_died(_score, pos):
	score += _score
	Explosion.global_position = pos
	Explosion.start()
	HUD.update_score(score)
	
func spawn_laser(Laser, location):
	var laser = Laser.instance()
	laser.global_position = location
	add_child(laser)

func spawn_enemy(EnemyScene, location):
	var enemy = EnemyScene.instance()
	enemy.global_position = location
	EnemyContainer.add_child(enemy)
	enemy.connect("enemy_died", self, "enemy_died")
	if enemy.has_signal("spawn_laser"):
		enemy.connect("spawn_laser", self, "spawn_laser")
	
func _on_Player_update_player_hp(amount):
	HUD.update_hp(amount)

func _on_Player_player_died():
	Explosion.global_position = player.global_position
	Explosion.start()
	var timer = get_tree().create_timer(1.5)
	yield(timer, "timeout")
	game_over()

func game_over():
	EnemySpawner.stop()	
	var game_over_menu = GAMEOVER.instance()
	game_over_menu.set_score(score)
	HUD.hide_score()
	$UILayer.add_child(game_over_menu)
