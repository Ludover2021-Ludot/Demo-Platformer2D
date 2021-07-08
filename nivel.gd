extends Node2D

export(Array, NodePath) var personajes

func _ready():
	$Jugador/Camera2D.limit_left = 0
	$Jugador/Camera2D.limit_top = 0
	$Jugador/Camera2D.limit_bottom = 550
	$Jugador.nivel = self
	$HUD/TextureRect/PanelCooldownGravedad.jugador = $Jugador
	$TransicionNivel.next = "NivelVertical.tscn"
	
func invertirGravedadGlobal():
	for personaje in personajes:
		get_node(personaje).invertirGravedad()
