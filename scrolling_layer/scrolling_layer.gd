extends ParallaxLayer

@onready var sprite = $Sprite2D

@export var texture: Texture
@export var scroll_scale: float = 0.0
@export var texture_size_x: float = 1920.0
@export var texture_size_y: float = 1080.0

func _ready():
	motion_scale.x = scroll_scale
	
	var scale_factor = get_viewport_rect().size.y / texture_size_y
	sprite.texture = texture
	sprite.scale = Vector2(scale_factor, scale_factor)
	motion_mirroring.x = texture_size_x * scale_factor
