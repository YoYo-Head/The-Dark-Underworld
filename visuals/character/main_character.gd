extends CharacterBody2D

var speed = 30


func _physics_process(delta: float) -> void:
	handle_input()
	
	
	move_and_slide()
	
func handle_input():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	


"""
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
		"""	
		
	
	
	
