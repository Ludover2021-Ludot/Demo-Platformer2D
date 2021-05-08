extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jugador

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rect_size.y = jugador.porcentaje_main_action_cooldown() * 50
