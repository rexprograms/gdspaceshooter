extends Node2D

export (Array, PackedScene) var enemies
signal spawn_enemy(enemy, location)

var spawn_positions = null

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()
	
func _on_SpawnTimer_timeout():
	spawn_random_enemy()
	
func spawn_random_enemy():
	var rand_enemy = enemies[randi() % enemies.size()]
	var rand_loc = spawn_positions[randi() % spawn_positions.size()].global_position
	emit_signal("spawn_enemy", rand_enemy, rand_loc)
	
