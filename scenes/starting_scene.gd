extends Node2D

@onready var dn = $Dialogue
@onready var gr = $GrimReaper

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await dn.appear_display_input_disappear("...")
	gr.visible = true
	await dn.appear_display_input_disappear("Grimmy - Like it or not kid but your dead, and there is nothing you human can do hahaha!")
	await dn.appear_display_input_disappear("Grimmy - But im feeling generous...")
	await dn.appear_display_input_disappear("Grimmy - All you have to do is find the book and destroy Hesta then your family will u be free.")
	var choice = await dn.make_decision("Grimmy - Do you accept?", "YES", "NO")
	
	if choice == 0:
		dn.appear_display_input_disappear("Grimmy - Prepare for the bounces back.")
		get_tree().change_scene_to_file("res://scenes/rings/outer_ring_scene.tscn")
	else:
		dn.appear_display_input_disappear("Your dead.")
		get_tree().quit()
		
		
	
	
	
	
	
	
	
