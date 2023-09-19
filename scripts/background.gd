extends Node2D

const PARALLAX = 0.6

@onready
var sprite0 = $sprite0 as Sprite2D
@onready
var sprite1 = $sprite1 as Sprite2D
@onready
var sprite2 = $sprite2 as Sprite2D
@onready
var sprite3 = $sprite3 as Sprite2D
@onready
var world = $/root/world as World

func _ready():
	show()

func _process(delta):
	if world.paused or world.game_over:
		return
	
	sprite0.region_rect.position.x += Pipe.SPEED * PARALLAX * delta / sprite0.scale.x
	sprite1.region_rect.position.x += Pipe.SPEED * PARALLAX * delta / sprite1.scale.x
	sprite2.region_rect.position.x += Pipe.SPEED * PARALLAX * delta / sprite2.scale.x
	sprite3.region_rect.position.x += Pipe.SPEED * PARALLAX * delta / sprite3.scale.x
	
	if sprite0.region_rect.position.x < -576:
		sprite0.region_rect.position.x = -sprite0.region_rect.position.x
	if sprite1.region_rect.position.x < -576:
		sprite1.region_rect.position.x = -sprite1.region_rect.position.x
	if sprite2.region_rect.position.x < -576:
		sprite2.region_rect.position.x = -sprite2.region_rect.position.x
	if sprite3.region_rect.position.x < -576:
		sprite3.region_rect.position.x = -sprite3.region_rect.position.x
	
	pass
