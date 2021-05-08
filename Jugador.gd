extends KinematicBody2D

# Constantes
const ACELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -900
const UP = Vector2(0,-1)
const main_action_cooldown = 1

onready var sprite = $Sprite
onready var animation = $AnimationPlayer
onready var rueda = $Rueda

var nivel

var current_main_action_cooldown = 0
var motion = Vector2(0, 0)

var gravedad

onready var Gravedad = preload("res://Gravedad.tscn")
var sentidoADondeMiraSegunCaminar = Vector2(DERECHA, 0)
var sentidoADondeMiraSegunGravedad = Vector2(DERECHA, 0)

var rotacionAlEstarDeCabeza = PI

enum {IZQUIERDA = -1, DERECHA = 1}

func sentidoEnElQueMira():
	return (sentidoADondeMiraSegunCaminar * sentidoADondeMiraSegunGravedad).x

func mirarEnSentidoCorrecto():
	sprite.flip_h = sentidoEnElQueMira() == DERECHA

onready var Disparo = preload("res://Campo de gravedad.tscn")

func _ready():
	gravedad = Gravedad.instance()

func porcentaje_main_action_cooldown():
	return current_main_action_cooldown / main_action_cooldown

func _physics_process(delta):
	efecto_gravitatorio()
	var friction = false
	current_main_action_cooldown = max(0, current_main_action_cooldown - delta)

	if Input.is_action_just_pressed("disparo"):
		var disparo = Disparo.instance()
		disparo.position = self.position
		get_tree().get_current_scene().add_child(disparo)
		disparo.motion = Vector2(sentidoADondeMiraSegunCaminar.x, 0)

	if Input.is_action_pressed("accion_principal"):
		if(current_main_action_cooldown <= 0):
			nivel.invertirGravedadGlobal()
			if(gravedad.esta_de_cabeza()):
				self.rotation = -(PI * sentidoADondeMiraSegunCaminar.x)
			rotacionAlEstarDeCabeza = PI * sentidoADondeMiraSegunCaminar.x
			current_main_action_cooldown = main_action_cooldown

	if Input.is_action_pressed("ui_right"):
		sentidoADondeMiraSegunCaminar.x = DERECHA
		animation.play("Walk")
		motion.x = min(motion.x + ACELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		sentidoADondeMiraSegunCaminar.x = IZQUIERDA
		animation.play("Walk")
		motion.x = max(motion.x - ACELERATION, -MAX_SPEED)
	else:
		animation.play("Idle")
		friction = true

	if (is_on_floor() && !gravedad.esta_de_cabeza()) or (is_on_ceiling() && gravedad.esta_de_cabeza()):
		if Input.is_action_pressed("accion_secundaria"):
			motion.y += JUMP_H * gravedad.y()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)

	mirarEnSentidoCorrecto()
	motion = move_and_slide(motion, UP)
	rueda.te_moviste_a(self.position, sprite.flip_h)

func efecto_gravitatorio():
	motion.y += gravedad.gravedad()
	var tazaDeRotacion = 0.08
	sentidoADondeMiraSegunGravedad.x = gravedad.y()
	if(gravedad.esta_de_cabeza()):
		self.rotation = lerp(self.rotation, rotacionAlEstarDeCabeza, tazaDeRotacion)
	else:
		self.rotation = lerp(self.rotation, 0, tazaDeRotacion)

func mori():
	get_tree().reload_current_scene()
	#queue_free()

func _on_Area2D_area_entered(enemigo):
	self.mori()
	
func invertirGravedad():
	gravedad.cambiar()
