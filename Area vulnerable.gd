extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func chocasteConRobot(robotito):
	get_parent().mori()

func chocaste_con_lava(lava):
	get_parent().mori()

func chocaste_con_trampolin(direccion):
	var personaje = get_parent()
	personaje.invertirGravedad()
	personaje.empujar(direccion)
	
func tocaste_el_boton():
	var piso = get_tree().get_root().get_node("NivelVertical/TileMap2")
	if(piso):
		piso.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
