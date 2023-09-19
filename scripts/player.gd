class_name Player
extends CharacterBody2D

var jump_velocity = -ProjectSettings.get_setting("physics/2d/default_gravity") * 0.4
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready
var world = $/root/world as World
@onready
var sprite = $sprite as AnimatedSprite2D
@onready
var wing_sound = $sounds/wing as AudioStreamPlayer
@onready
var hit_sound = $sounds/hit as AudioStreamPlayer
@onready
var die_sound = $sounds/die as AudioStreamPlayer
@onready
var point_sound = $sounds/point as AudioStreamPlayer

signal on_dead
var dead = false:
	set(value):
		dead = value
		if dead:
			on_dead.emit()

signal score_updated(score)
var score:
	set(value):
		score = value
		score_updated.emit(score)

func _ready():
	score = 0

func _physics_process(delta):
	if world.paused:
		return
	
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and not world.game_over:
		velocity.y = jump_velocity
		wing_sound.play()
		
	# Handle animation playing
	rotation = Vector2(Pipe.SPEED, velocity.y).angle()
	if velocity.y > 0:
		sprite.play("falling")
	else:
		sprite.play("rising")

	move_and_slide()
	
func _on_world_bounds_body_exited(body):
	if body == self and not dead:
		dead = true
		hit_sound.play()
		die_sound.play()

func _on_pipe_hit(body):
	if body == self and not dead:
		dead = true
		hit_sound.play()
		die_sound.play()
		
func _on_pipe_passed(body):
	if body == self and not dead:
		score += 1
		point_sound.play()

func _on_world_pause_changed(paused):
	if paused:
		sprite.pause()
	else:
		sprite.play()
