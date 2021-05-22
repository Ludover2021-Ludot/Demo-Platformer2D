extends "res://nivel.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
		._ready()
		$Jugador/Camera2D.limit_bottom = 100000
		$Jugador/Camera2D.limit_top = -100000
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
