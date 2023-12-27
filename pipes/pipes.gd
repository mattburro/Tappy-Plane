extends Node2D

const SCROLL_SPEED: float = 150.0

func _process(delta):
	position.x -= SCROLL_SPEED * delta

func on_visible_notifier_screen_exited():
	queue_free()
