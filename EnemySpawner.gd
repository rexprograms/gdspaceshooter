extends Node2D

export (Array, PackedScene) var enemies
signal spawn_enemy(enemy, location)

var spawn_positions = null
var last_loc = null

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()
	
func _on_SpawnTimer_timeout():
	spawn_random_enemy()
	
func _on_SpawnTimer2_timeout():
	spawn_random_enemy()
	
func spawn_random_enemy():
	var rand_enemy = randi() % enemies.size() 
	var rand_loc = randi() % spawn_positions.size()
	if(rand_loc == last_loc):
		rand_loc = (rand_loc + 1) % spawn_positions.size()
	last_loc = rand_loc	
	emit_signal("spawn_enemy", enemies[rand_enemy], spawn_positions[rand_loc].global_position)
	
func stop():	
	$SpawnTimer.stop()
	$SpawnTimer2.stop()
	
func start():
	$SpawnTimer.start()
	$SpawnTimer2.start()
