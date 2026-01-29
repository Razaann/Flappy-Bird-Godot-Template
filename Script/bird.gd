# Explain this, that evry gdscript code node, has this to show what node we currently code
extends CharacterBody2D

# Variable, the @, var/const, name then the after :
const jumpVelocity: int = -400
@onready var jump_sfx: AudioStreamPlayer2D = $JumpSfx

# Func, this & _ready and other nesecesrry func
func _physics_process(delta: float) -> void:
	# Get gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	gameOver()
	
	# Accepting input, and tell the difference between action
	if Input.is_action_just_pressed("ui_accept"):
		jump_sfx.play()
		velocity.y = jumpVelocity
	
	rotation_degrees = velocity.y * 0.1
	rotation_degrees = clamp(rotation_degrees, -45, 90)

func gameOver():
	if is_on_floor() or is_on_ceiling() or is_on_wall():
		print("died")
		get_tree().reload_current_scene()
		return

# Necesearry for movement i think
	move_and_slide()
