class_name enemy
extends CharacterBody2D

@export var boss_id: int
@export var boss_name: String
@export var damage: int
@export var maxhealth: int
@export var speed: float
@export var sight_area: Area2D

var playerInSight = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sight_area.body_entered.connect(_on_body_entered)
	sight_area.body_exited.connect(_on_body_exited)


"""
func humanInSight() -> bool:
	if sight_area.area_entered:
		return true
	else:
		return false
"""		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInSight:
		
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		playerInSight = true
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "MainCharacter":
		playerInSight = false
	
