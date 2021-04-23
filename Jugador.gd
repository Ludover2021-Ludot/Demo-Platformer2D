extends KinematicBody2D

# Constantes
const ACELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -900
const UP = Vector2(0,-1)
const GRAVITY = 40

onready var sprite = $Sprite
onready var animation = $AnimationPlayer

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
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
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
		
		
	motion = move_and_slide(motion, UP)
