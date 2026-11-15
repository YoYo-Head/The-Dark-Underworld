extends enemy

var playingSound = false

@onready var currentHealth: int = 100

func _ready() -> void:
	super._ready()
	
	boss_id = 1
	boss_name = "Enemy"
	damage = 10
	maxHealth = 100
	speed = 50
	

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	
