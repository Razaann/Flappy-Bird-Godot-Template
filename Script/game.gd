extends Node2D

@onready var base: AnimatableBody2D = $Base
@onready var base_2: AnimatableBody2D = $Base2
@onready var sprite_2d: Sprite2D = $Base/Sprite2D
@export var pipe_scene: PackedScene

var speed: int = 400

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	base_movement(base, delta)
	base_movement(base_2, delta)


func spawn_pipe():
	var pipe_instance = pipe_scene.instantiate()
	var x_pos = get_viewport_rect().size.x + 100
	var y_pos = randf_range(400.0, 400.0)
	
	pipe_instance.position = Vector2(x_pos, y_pos)
	add_child(pipe_instance)


func base_movement(AnimatableBody2D, delta):
	AnimatableBody2D.position.x -= speed * delta
	#var width = sprite_2d.texture.get_width()
	var width = sprite_2d.texture.get_width() * 2
	
	if AnimatableBody2D.position.x < -width:
		AnimatableBody2D.position.x += 2 * width


func _on_spawn_timer_timeout() -> void:
	spawn_pipe()
