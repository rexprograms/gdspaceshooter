extends Control

class_name HUD

onready var score_label = $ScoreLabel
onready var life_bar = $LifeBar

func update_score(score):
	score_label.text = "Score: %d" % score
	
func update_hp(amount):
	life_bar.update_hp(amount)
