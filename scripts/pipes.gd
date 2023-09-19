extends Node2D

var pipe_prefab = preload("res://scenes/pipe.tscn")
var npipes = 0

@onready
var player = %player as Player

func _on_timer_timeout():
	var pipe = pipe_prefab.instantiate() as Pipe
	
	pipe.name = "pipe-%d" % npipes
	pipe.position.x = 638
	pipe.position.y = randf_range(-200, 200)
	pipe.scale = Vector2(1.5, 1.5)
	
	pipe.hit.connect(player._on_pipe_hit)
	pipe.passed.connect(player._on_pipe_passed)
	
	add_child(pipe)
	npipes += 1
