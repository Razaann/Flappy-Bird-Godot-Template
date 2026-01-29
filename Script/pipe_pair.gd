extends Node2D

var speed = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x < -100:
		queue_free()
