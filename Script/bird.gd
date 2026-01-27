# Explain this, that evry gdscript code node, has this to show what node we currently code
extends CharacterBody2D

# Variable, the @, var/const, name then the after :
@onready var sprite_2d: Sprite2D = $Sprite2D
const jumpVelocity: int = -400

# Func, this & _ready and other nesecesrry func
func _physics_process(delta: float) -> void:
	# Get gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Accepting input, and tell the difference between action
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jumpVelocity
	
	rotation_degrees = velocity.y * 0.1

# Necesearry for movement i think
	move_and_slide()
