extends KinematicBody2D

var motion = Vector2(0,0)
	
export var SPEED = 450
export var JUMP = 800
export var Gravity = 60
export var Jump_count = 0


func _physics_process(delta):
	apply_gravity()
	jump()	
	walk()
	update_animation()
	
	move_and_slide(motion,Vector2(0,-1))
func update_animation():
	if motion.y <0:
		$AnimatedSprite.play("jump")
		
	elif motion.x <0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
		
	elif motion.x >0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		
	else:
		$AnimatedSprite.play("idle")

func is_dead():
	if motion.y > 2500:
		return true
		
	return false
	
func apply_gravity():
	motion.y = motion.y + Gravity
	if is_on_floor():
		motion.y = 0
		
	
	
func jump():	
	if Input.is_action_just_pressed("jump"):
		if Jump_count < 2 :
				motion.y -= JUMP
				Jump_count = Jump_count+1
				$AudioStreamPlayer.play()

	if is_on_floor():

			Jump_count = 0
	
		

		
func walk():
	if  Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
		#print("I move left")
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
		#print("I move right")
	else: 
		motion.x = 0


		

	
	
		
		