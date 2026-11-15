extends enemy

@onready var currentHealth: int = 100

func _ready() -> void:
	super._ready()
	
	boss_id = 1
	boss_name = "Enemy"
	damage = 10
	maxHealth = 30
	speed = 50
	

func _physics_process(delta: float) -> void:
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	super._physics_process(delta)
	
	
