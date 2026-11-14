extends CharacterBody2D

var speed = 30
var playingSound = false

@export var maxhealth = 500
@onready var currentHealth: int = 500


func _physics_process(delta: float) -> void:
	handle_input()
	
	
	move_and_slide()
	
func handle_input():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	
	if velocity.length() > 0:
		if playingSound == false:
			$AudioStreamPlayer2D.play()
			playingSound = true
			
		$AnimatedSprite2D.play()
			
	else:
		$AnimatedSprite2D.stop()
		$AudioStreamPlayer2D.stop()
		playingSound = false
	


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
		
	
	
	


func _on_audio_stream_player_2d_finished() -> void:
	playingSound = false
