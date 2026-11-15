extends Node2D

@onready var begin_button = $beginButton

func _ready():
	pass


func _on_begin_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/starting_scene.tscn")
