extends KinematicBody2D

const speed = 150
const UP = Vector2(0,-1)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2(0, 0)
onready var sprite = $Sprite
var gravedad
var prendido = false
var direccion = 1

onready var Gravedad = preload("res://Gravedad.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.flip_h = direccion == -1
	gravedad = Gravedad.instance()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(prendido):
		efecto_gravitatorio()
		motion.x = speed * direccion
		motion = move_and_slide(motion, UP)
		if(motion.x == 0):
			self.darse_vuelta()
			
func darse_vuelta():
	direccion *= -1
	sprite.flip_h = not sprite.flip_h
	
			
		
func efecto_gravitatorio():
	motion.y = motion.y + gravedad.gravedad()
	sprite.flip_v = gravedad.esta_de_cabeza()
	
func tocaste_al_jugador(jugador):
	jugador.mori()

func prenderse():
	prendido = true

func _on_Area_area_entered(area):
	area.chocasteConRobot(self)
	
func invertirGravedad():
	gravedad.cambiar()
