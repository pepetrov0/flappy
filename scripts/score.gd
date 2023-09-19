extends Label

func _on_player_score_updated(score):
	if score > 0:
		show()
	else:
		hide()
		
	text = "%d" % score
