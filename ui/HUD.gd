extends Control

class_name HUD

onready var score_label = $ScoreLabel

func update_score(score):
	score_label.text = "Score: %d" % score
