class_name enemy
extends CharacterBody2D

@export var boss_id: int
@export var boss_name: String
@export var damage: int
@export var maxHealth: int
@export var speed: float
@export var sight_area: Area2D
@export var damage_area: Area2D

var target: CharacterBody2D = null
var playerInSight = false

var stopMovement = false
var canDamage = false
var isDead = false

var direction


func _ready() -> void:
	sight_area.body_entered.connect(_on_body_entered)
	sight_area.body_exited.connect(_on_body_exited)
	damage_area.body_entered.connect(_on_damage_area_entered)
	damage_area.body_exited.connect(_on_damage_area_exited)


func _physics_process(delta: float) -> void:
	if not stopMovement and is_instance_valid(target) and playerInSight:
	
		direction = global_position.direction_to(target.global_position)
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
	
	if canDamage and not stopMovement:
		give_damage()

func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "MainCharacter":
	
		playerInSight = true
		target = body as CharacterBody2D
		
func _on_damage_area_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		print("test")
	
		canDamage = true
		
func _on_damage_area_exited(body: Node2D) -> void:
	if body.name == "MainCharacter":
	
		canDamage = false

func _on_body_exited(body: Node2D) -> void:
	
	if body == target:
		playerInSight = false
		target = null
		
func give_damage():
	target.currentHealth -= damage
	
	stopMovement = true
	target.apply_knockback(direction * 400)
	
	await get_tree().create_timer(1.0).timeout
	
	stopMovement = false
	
func on_death():
	if isDead:
		return

	isDead = true

	velocity = Vector2.ZERO

	print(boss_name, " has died!")

	queue_free()
	
	
	
