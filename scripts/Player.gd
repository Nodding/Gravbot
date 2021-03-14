extends KinematicBody2D

const GRAV = 9.8
var thedirection = "none"
var motion = Vector2()

signal direct(x, y, thedirection)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$Sprite.play("right")
		thedirection = "right"
		#emit_signal("direct", position.x, position.y, thedirection)
	elif Input.is_action_pressed("ui_left"):
		$Sprite.play("left")
		thedirection = "left"
		#emit_signal("direct", position.x, position.y, thedirection)
	elif Input.is_action_pressed("ui_up"):
		$Sprite.play("up")
		thedirection = "up"
		#emit_signal("direct", position.x, position.y, thedirection)
	elif Input.is_action_pressed("ui_down"):
		$Sprite.play("down")
		thedirection = "down"
		#emit_signal("direct", position.x, position.y, thedirection)
	elif Input.is_action_pressed("ui_select"):
		$Sprite.play("idle")
		motion.x = 0
		motion.y = 0
	elif Input.is_action_pressed("push_right"):
		emit_signal("direct", position.x, position.y, thedirection)
	elif Input.is_action_pressed("push_left"):
		emit_signal("direct", position.x, position.y, thedirection)
	elif Input.is_action_pressed("push_up"):
		emit_signal("direct", position.x, position.y, thedirection)
	elif Input.is_action_pressed("push_down"):
		emit_signal("direct", position.x, position.y, thedirection)
	elif is_on_wall():
		$Sprite.play("idle")
		motion.x = 0
		motion.y = 0
	if thedirection == "right":
		motion.x = motion.x + GRAV
	elif thedirection == "left":
		motion.x = motion.x - GRAV
	elif thedirection == "up":
		motion.y = motion.y - GRAV
	elif thedirection == "down":
		motion.y = motion.y + GRAV
	else:
		motion.x = 0
		motion.y = 0
	motion = move_and_slide(motion)

func _on_Player_direct(x, y, thedirection):
	pass # Replace with function body.
