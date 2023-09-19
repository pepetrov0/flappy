extends Sprite2D

func _on_world_game_over_changed(game_over):
	if game_over:
		show()
	else:
		hide()
