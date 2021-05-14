extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Gravedad = preload("res://Gravedad.tscn")


var personajes

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/TextureRect/PanelCooldownGravedad.jugador = $Jugador
	personajes = [$Jugador, $Robotito, $Robotito2]
	$Jugador.nivel = self
	
func invertirGravedadGlobal():
	for personaje in personajes:
		personaje.invertirGravedad()

