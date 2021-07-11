extends "res://nivel.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Jugador/Camera2D.zoom *= 2
	$Jugador/Camera2D.limit_top = -400
	$Jugador/Camera2D.limit_bottom = 800
	
func spawn_robotito(robotito):
	personajes_spawneados.push_back(robotito)
	self.add_child(robotito)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
