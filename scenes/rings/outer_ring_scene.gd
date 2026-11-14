extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_next_ring_area_area_entered(_area: Area2D) -> void:
	print("test")
	
	get_tree().change_scene_to_file("res://scenes/rings/middle_ring_scene.tscn")
