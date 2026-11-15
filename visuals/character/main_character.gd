extends CharacterBody2D

var speed = 30
var playingSound = false
var knockback_velocity: Vector2 = Vector2.ZERO

var isDead = false

@export var allowInput = false
@export var showBar = false

@export var maxHealth = 10
@onready var currentHealth: int = 10

func _physics_process(delta: float) -> void:
	
	if not showBar:
		$HealthBar.visible = false
	else:
		$HealthBar.visible = true
	
	if allowInput:
		handle_input()
	
	velocity += knockback_velocity

	knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, 500 * delta)
	
	if currentHealth <= 0:
		isDead = true
	
	move_and_slide()
	
	on_death()
	
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
	
func apply_knockback(force: Vector2) -> void:
	knockback_velocity = force
	
func teleport(coord: Vector2):
	global_position = coord
	
	
func on_death():
	if not isDead:
		return
		
	isDead = false
	
	teleport(Vector2(50, 50))
	
	currentHealth = maxHealth
	
