extends "res://nivel.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
		._ready()
		$Jugador/Camera2D.limit_top = -400
		$Jugador/Camera2D.limit_left = -1000000
		$Jugador/Camera2D.zoom = Vector2(1.5, 1.5)
		var robots = [
			$Robotito,
			$Robotito2,
			$Robotito3,
			$Robotito4,
			$Robotito5,
			$Robotito6,
			$Robotito7,
			$Robotito8,
			$Robotito9,
			$Robotito10,
			$Robotito11,
			$Robotito12,
			$Robotito13,
			$Robotito14,
			$Robotito15,
			$Robotito16,
			$Robotito17,
			$Robotito18,
			$Robotito19,
			$Robotito20,
			$Robotito21
		]
		for robot in robots:
			robot.prenderse()
		var robotsADerecha = [
			$Robotito15,
			$Robotito16,
			$Robotito17,
			$Robotito18,
			$Robotito19,
			$Robotito20,
			$Robotito21
		]
		for robot in robotsADerecha:
			robot.rotar()

func invertirGravedadGlobal():
	var ps = [
			$Jugador,
			$Robotito,
			$Robotito2,
			$Robotito3,
			$Robotito4,
			$Robotito5,
			$Robotito6,
			$Robotito7,
			$Robotito8,
			$Robotito9,
			$Robotito10,
			$Robotito11,
			$Robotito12,
			$Robotito13,
			$Robotito14,
			$Robotito15,
			$Robotito16,
			$Robotito17,
			$Robotito18,
			$Robotito19,
			$Robotito20,
			$Robotito21]
	for personaje in ps:
		if(personaje):
			personaje.invertirGravedad()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
