extends Node2D

func _on_world_pause_changed(paused):
	if not paused:
		hide()
