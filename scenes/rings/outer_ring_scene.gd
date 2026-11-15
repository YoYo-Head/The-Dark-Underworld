extends Node2D

@onready var mummy = $Node2D/MainCharacter2

var min_1x = 50
var max_1x = 250

var min_2x = 860
var max_2x = 1125

var min_y = 20
var max_y = 775

var max_mummies = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.play()
	
	for i in range(20):
		var clone = mummy.duplicate()
		
		clone.global_position = get_random_spawn()
		
		add_child(clone)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_next_ring_area_area_entered(_area: Area2D) -> void:
	
	if $Node2D/MainCharacter.damage <= 100:
		$Dialogue.appear_display_input_disappear("You lost since you didn't have enough damage!")
		get_tree().quit()
	elif $Node2D/MainCharacter.maxHealth <= 100:
		$Dialogue.appear_display_input_disappear("You lost since you didn't have enough health!")
		get_tree().quit()
	else:
		$Dialogue.appear_display_input_disappear("You won!")
		get_tree().quit()
	
	
func get_random_spawn():
	var randX1 = randi_range(min_1x, max_1x)
	var randX2 = randi_range(min_2x, max_2x)
	
	var randX = randi_range(1, 2)
	
	if randX == 1:
		randX = randX1
	else:
		randX = randX2
		
	var randY = randi_range(min_y, max_y)
	
	return Vector2(randX, randY)


func _on_main_character_2_enemy_died() -> void:
	var clone = $Node2D/MainCharacter2
	
	clone.position = get_random_spawn()
	
	add_child(clone)
