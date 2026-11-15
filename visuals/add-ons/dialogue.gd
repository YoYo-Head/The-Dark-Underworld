extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func appear_display_input_disappear(text):
	self.visible = true
	$VBoxContainer/Label.text = text + " [B to continue]"
	while true:
		if Input.is_key_pressed(KEY_B):
			break
		else:
			await get_tree().create_timer(1).timeout
			
			
	$VBoxContainer/Label.text = ""
	self.visible = false
		
func make_decision(text, optionA, optionB):
	self.visible = true
	$VBoxContainer/Label.text = text + " [C for " + optionA + " or V for " + optionB + "]"
	
	while true:
		if Input.is_key_pressed(KEY_C):
			return 0
		elif Input.is_key_pressed(KEY_V):
			return 1
		else:
			await get_tree().create_timer(0.1).timeout
	$VBoxContainer/Label.text = ""
	self.visible = false
	
	
