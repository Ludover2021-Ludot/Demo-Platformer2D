extends "res://nivel.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var salioDeLaSalaInicial = false

func pos_between(jugador, min_x, max_x, min_y, max_y):
	var position = jugador.position
	return (position.x > min_x && position.x < max_x && position.y > min_y && position.y < max_y)


func _ready():
		._ready()
		$Jugador/Camera2D.limit_bottom = 896
		$Jugador/Camera2D.limit_top = 456
		$Jugador/Camera2D.limit_right = 1880
		$Jugador/Camera2D.zoom = Vector2(0.9, 0.9)
		$Puerta7.toggle()
		$Puerta8.toggle()
		
		#$Jugador/Camera2D.zoom *= 0.9	

func _process(delta):
	print($Jugador.position.y)
	if($Jugador.position.y < 456):
		salioDeLaSalaInicial = true
		$Jugador/Camera2D.zoom = Vector2(2, 2)
	if($Jugador.position.y < -584):
		$Jugador/Camera2D.limit_top = move_toward($Jugador/Camera2D.limit_top, -2000, 10)
		$Jugador/Camera2D.limit_bottom = move_toward($Jugador/Camera2D.limit_bottom, -584, 10)
	elif($Jugador.position.y < -384):
		$Jugador/Camera2D.limit_top = move_toward($Jugador/Camera2D.limit_top, -1544, 10)
		$Jugador/Camera2D.limit_bottom = move_toward($Jugador/Camera2D.limit_bottom, -384, 10)
	elif($Jugador.position.y < 16):
		$Jugador/Camera2D.limit_top = move_toward($Jugador/Camera2D.limit_top, -396, 10)
		$Jugador/Camera2D.limit_bottom = move_toward($Jugador/Camera2D.limit_bottom, 16, 10)
	elif($Jugador.position.y < 456 or salioDeLaSalaInicial):
		$Jugador/Camera2D.limit_bottom = move_toward($Jugador/Camera2D.limit_bottom, 896, 10)
		$Jugador/Camera2D.limit_top = move_toward($Jugador/Camera2D.limit_top, 16, 10)
	else:
		$Jugador/Camera2D.limit_bottom = move_toward($Jugador/Camera2D.limit_bottom, 896, 10)
		$Jugador/Camera2D.limit_top = move_toward($Jugador/Camera2D.limit_top, 456, 10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if(pos_between($Jugador, 0, 720, 456, 896)):
#		$Jugador/Camera2D.limit_bottom = 896
#		$Jugador/Camera2D.limit_top = 456
#		$Jugador/Camera2D.limit_left = 0
#		$Jugador/Camera2D.limit_right = 720
#		$Jugador/Camera2D.zoom = Vector2(1, 1) * 0.9
#	else:
#		$Jugador/Camera2D.limit_bottom = 896
#		$Jugador/Camera2D.limit_top = 16
#		$Jugador/Camera2D.limit_left = 0
#		$Jugador/Camera2D.limit_right = 1880
#		$Jugador/Camera2D.zoom = Vector2(1, 1) * 2
#		$Jugador/Camera2D/ParallaxBackground.scale = Vector2(1.5, 1.5)
