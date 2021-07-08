extends Node2D

# Declare member variables here. Examples:
# var a = 2
var next = "Fin.tscn"


func _on_Area2D_area_entered(area):
#	if area.is_in_group("Jugador"):
		get_tree().change_scene("res://" + next);
