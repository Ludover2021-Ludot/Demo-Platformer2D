extends KinematicBody2D

# Constantes
const ACELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -900
const UP = Vector2(0,-1)
const initial_gravity = 40
var gravity = initial_gravity
const main_action_cooldown = 1
var current_main_action_cooldown = main_action_cooldown
onready var sprite = $Sprite
onready var animation = $AnimationPlayer
var motion = Vector2()
var gravity_vector = Vector2(0, 1)

func is_gravity_flipped():
	return gravity_vector.y == -1

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	current_main_action_cooldown = max(0, current_main_action_cooldown - delta)
	
	if Input.is_action_pressed("accion_principal"):
		if(current_main_action_cooldown <= 0):
			gravity_vector *= (-1)
			current_main_action_cooldown = main_action_cooldown
			
	sprite.flip_v = is_gravity_flipped()
	gravity = initial_gravity * gravity_vector.y
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animation.play("Walk")
		motion.x = min(motion.x + ACELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animation.play("Walk")
		motion.x = max(motion.x - ACELERATION, -MAX_SPEED)
	else:
		animation.play("Idle")
		friction = true
		
	if (is_on_floor() && !is_gravity_flipped()) or (is_on_ceiling() && is_gravity_flipped()):
		if Input.is_action_pressed("accion_secundaria"):
			motion.y += JUMP_H * gravity_vector.y
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)

	motion = move_and_slide(motion, UP)
