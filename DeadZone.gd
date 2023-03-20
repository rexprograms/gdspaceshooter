extends Area2D



func _on_DeadZone_area_entered(area):
	area.queue_free()
