extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func appear_display_input_disappear(text):
	self.visible = true
	$VBoxContainer/Label.text = text + " [space to continue]"
	while true:
		if Input.is_action_just_pressed("ui_accept"):
			break
		else:
			await get_tree().create_timer(0.1).timeout
			
			
		$VBoxContainer/Label.text = ""
		self.visible = false
	
