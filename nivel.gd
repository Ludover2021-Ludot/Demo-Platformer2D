extends Node2D

export(Array, NodePath) var personajes
var personajes_spawneados = []

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
	for personaje_spawneado in personajes_spawneados:
		personaje_spawneado.invertirGravedad()
