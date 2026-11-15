
extends Container

@onready var begin_button = $StartButton
@onready var controls_button = $TextureButton2
@onready var settings_button = $TextureButton3


func _ready():
	begin_button.pressed.connect(_on_begin_pressed)
	controls_button.pressed.connect(_on_controls_pressed)
	settings_button.pressed.connect(_on_settings_pressed)


# BEGIN BUTTON
func _on_begin_pressed():
	get_tree().change_scene_to_file("res://scenes/starting_scene.tscn")


# CONTROLS BUTTON
func _on_controls_pressed():
	var popup = AcceptDialog.new()
	popup.title = "CONTROLS"
	popup.dialog_text = "WASD / ARROW KEYS - MOVE\nSPACE - JUMP\nESC - PAUSE"
	add_child(popup)
	popup.confirmed.connect(popup.queue_free)
	popup.canceled.connect(popup.queue_free)
	popup.popup_centered()


# SETTINGS BUTTON
func _on_settings_pressed():
	var popup = AcceptDialog.new()
	popup.title = "SETTINGS"
	popup.dialog_text = "Settings will be available here!"
	add_child(popup)
	popup.confirmed.connect(popup.queue_free)
	popup.popup_centered()
