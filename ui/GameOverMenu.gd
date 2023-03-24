extends Control

func _ready():
	$AnimationPlayer.play("animate_score")

func set_score(score):
	$Score.text = "Score: %d" % score

func _on_Retry_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Main_Menu_pressed():
	get_tree().change_scene("res://ui/MainMenu.tscn")
