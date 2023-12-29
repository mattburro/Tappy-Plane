extends Node2D

const SCROLL_SPEED: float = 150.0

func _process(delta):
	position.x -= SCROLL_SPEED * delta

func player_scored() -> void:
	GameManager.increment_score()

func on_visible_notifier_screen_exited():
	queue_free()

func on_pipe_entered(body: Node2D):
	if body.is_in_group(GameManager.GROUP_PLANE):
		body.die()

func on_laser_body_entered(body: Node2D):
	if body.is_in_group(GameManager.GROUP_PLANE):
		player_scored()
