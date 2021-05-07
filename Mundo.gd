extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Gravedad = preload("res://Gravedad.tscn")


var personajes

# Called when the node enters the scene tree for the first time.
func _ready():
	personajes = [$Jugador, $Robotito, $Robotito2]
	$Jugador.nivel = self
	
func invertirGravedadGlobal():
	for personaje in personajes:
		personaje.invertirGravedad()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
