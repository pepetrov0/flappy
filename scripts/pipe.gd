class_name Pipe
extends Node2D

const SPEED = 200

signal hit(body)
signal passed(body)

@onready
var world = $/root/world as World

func _physics_process(delta):
	if world.paused or world.game_over:
		return
	
	position.x -= SPEED * delta
	
	if position.x < -680:
		queue_free()

func _on_top_body_entered(body):
	hit.emit(body)

func _on_bottom_body_entered(body):
	hit.emit(body)

func _on_middle_body_exited(body):
	passed.emit(body)
