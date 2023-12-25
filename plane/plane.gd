extends CharacterBody2D

@onready var animation_player = $AnimationPlayer

const GRAVITY: float = 1800.0
const POWER: float = -400.0

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()

func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("fly")
