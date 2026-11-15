extends ProgressBar

var parent

func _ready() -> void:
	parent = get_parent()

	max_value = parent.maxHealth
	value = parent.currentHealth

func _process(_delta: float) -> void:
	if parent == null:
		return

	max_value = parent.maxHealth
	value = parent.currentHealth
	"""
	if parent.currentHealth < parent.maxhealth:
		visible = true
	else:
		visible = false
	"""	
	$healthLabel.text = str(int(value))
		
	
