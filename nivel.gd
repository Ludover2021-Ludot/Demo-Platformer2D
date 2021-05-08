extends Node2D

export(Array, NodePath) var personajes

func _ready():
	$Jugador.nivel = self
	$HUD/TextureRect/PanelCooldownGravedad.jugador = $Jugador
	
func invertirGravedadGlobal():
	for personaje in personajes:
		get_node(personaje).invertirGravedad()
