extends CharacterBody2D

var speed = 30
var playingSound = false
var knockback_velocity: Vector2 = Vector2.ZERO
var damage = 1

var isDead = false

@onready var progressBar = $ProgressBar

@export var allowInput = false
@export var showBar = false

@export var maxHealth = 1
@onready var currentHealth: int = 1

func _physics_process(delta: float) -> void:
	
	progressBar.value = currentHealth
	
	if not showBar:
		progressBar.visible = false
	else:
		progressBar.visible = true
	
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
	
	maxHealth += 1
	currentHealth = maxHealth
	
	progressBar.max_value = maxHealth
	
	teleport(Vector2(50, 50))
	
	currentHealth = maxHealth
	


func _on_main_character_2_enemy_died() -> void:
	damage += 1
