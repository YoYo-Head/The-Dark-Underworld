extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gender_sprites = {
	"male": $male,
	"female": $female
}


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func switch_gender(type: int):
	# 0: female
	# 1: male
	
	if type == 0:
		# female character
		gender_sprites["male"].visibility = false
		gender_sprites["female"].visibility = true
	else:
		# male character
		gender_sprites["female"].visibility = false
		gender_sprites["male"].visibility = true
		
		
	
	
	
