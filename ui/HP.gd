extends Node2D

onready var animate = $AnimationPlayer

func _ready():
	animate.play("fade_in")
	pass
	
func destroy():
	animate.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		queue_free()
	
