extends KinematicBody2D

# Constantes
const ACELERATION = 70
const MAX_SPEED = 300
const MAX_FREEFALL_SPEED = 900
const JUMP_H = -900
const UP = Vector2(0,-1)
const main_action_cooldown = 1

onready var sprite = $Cabeza
onready var animation = $AnimationPlayer
onready var rueda = $Rueda

const duracion_de_efecto_de_ser_empujado = 1
var tiempo_restante_de_ser_empujado = 0

var nivel

var current_main_action_cooldown = 0
var motion = Vector2(0, 0)

var gravedad

onready var Gravedad = preload("res://Gravedad.tscn")
var sentidoADondeMiraSegunCaminar = Vector2(DERECHA, 0)

var rotacionAlEstarDeCabeza = PI

enum {IZQUIERDA = -1, DERECHA = 1}

func sentidoEnElQueMira():
	return (sentidoADondeMiraSegunCaminar * gravedad.y()).x

func mirarEnSentidoCorrecto():
	sprite.flip_h = sentidoEnElQueMira() == DERECHA

onready var Disparo = preload("res://Campo de gravedad.tscn")

func _ready():
	gravedad = Gravedad.instance()

func siendo_empujado():
	return (tiempo_restante_de_ser_empujado > 0)

func porcentaje_main_action_cooldown():
	return current_main_action_cooldown / main_action_cooldown

func _physics_process(delta):
	efecto_gravitatorio()
	var friction = false
	tiempo_restante_de_ser_empujado = max(0, tiempo_restante_de_ser_empujado - delta)
	current_main_action_cooldown = max(0, current_main_action_cooldown - delta)

	if Input.is_action_just_pressed("disparo"):
		var disparo = Disparo.instance()
		disparo.position = self.position
		get_tree().get_current_scene().add_child(disparo)
		disparo.motion = Vector2(sentidoADondeMiraSegunCaminar.x, 0)

	if Input.is_action_pressed("accion_principal"):
		if(current_main_action_cooldown <= 0):
			rotacionAlEstarDeCabeza = PI * sentidoADondeMiraSegunCaminar.x
			if(gravedad.esta_de_cabeza()):
				self.rotation = rotacionAlEstarDeCabeza
			nivel.invertirGravedadGlobal()
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
	chequear_si_esta_tocando_pinches()
	rueda.te_moviste_a(self.position, sprite.flip_h)

func chequear_si_esta_tocando_pinches():
	var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		var danger = collision.collider.is_in_group("Danger")
		if(danger):
			mori()

func efecto_gravitatorio():
	motion.y += gravedad.gravedad()
	if(not siendo_empujado()):
		motion.y = clamp(motion.y, -MAX_FREEFALL_SPEED, MAX_FREEFALL_SPEED)
	var tazaDeRotacion = 0.08
	if(gravedad.esta_de_cabeza()):
		self.rotation = lerp(self.rotation, rotacionAlEstarDeCabeza, tazaDeRotacion)
	else:
		self.rotation = lerp(self.rotation, 0, tazaDeRotacion)

func empujar(direccion):
	tiempo_restante_de_ser_empujado = duracion_de_efecto_de_ser_empujado
	motion.y = 3000 * direccion.y

func mori():
	get_tree().reload_current_scene()
	#queue_free()
	
func invertirGravedad():
	gravedad.cambiar()
