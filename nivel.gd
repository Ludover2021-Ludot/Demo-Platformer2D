extends Node2D

export(Array, NodePath) var personajes

func _ready():
	$Jugador.nivel = self
	
func invertirGravedadGlobal():
	for personaje in personajes:
		get_node(personaje).invertirGravedad()
