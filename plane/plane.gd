extends CharacterBody2D

signal died

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite = $AnimatedSprite2D

const GRAVITY: float = 1800.0
const POWER: float = -400.0

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor():
		die()

func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("fly")

func die() -> void:
	animated_sprite.stop()
	set_physics_process(false)
	died.emit()
