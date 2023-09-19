class_name World
extends Node2D

signal pause_changed(paused)
var paused:
	set(value):
		paused = value
		pause_changed.emit(paused)
		
signal game_over_changed(game_over)
var game_over:
	set(value):
		game_over = value
		game_over_changed.emit(value)

func _ready():
	paused = true
	game_over = false

func _unhandled_input(event):
	if game_over:
		if event.is_action_pressed("jump"):
			get_tree().reload_current_scene()
	else:
		if event.is_action_pressed("pause") and not paused:
			paused = true
		if event.is_action_pressed("jump") and paused:
			paused = false
	return

func _on_player_on_dead():
	game_over = true
