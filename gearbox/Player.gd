extends KinematicBody2D

const GRAV = 9.8
var direction = "none"
var motion = Vector2()

signal direct(direction, field)

var field = preload("res://gearbox/field.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$Sprite.play("right")
		direction = "right"
	elif Input.is_action_pressed("ui_left"):
		$Sprite.play("left")
		direction = "left"
	elif Input.is_action_pressed("ui_up"):
		$Sprite.play("up")
		direction = "up"
	elif Input.is_action_pressed("ui_down"):
		emit_signal("direct", direction)
		$Sprite.play("down")
		direction = "down"
	elif Input.is_action_pressed("ui_select"):
		$Sprite.play("idle")
		motion.x = 0
		motion.y = 0
	elif is_on_wall():
		$Sprite.play("idle")
		motion.x = 0
		motion.y = 0
	if direction == "right":
		motion.x = motion.x + GRAV
	elif direction == "left":
		motion.x = motion.x - GRAV
	elif direction == "up":
		motion.y = motion.y - GRAV
	elif direction == "down":
		motion.y = motion.y + GRAV
	else:
		motion.x = 0
		motion.y = 0
	motion = move_and_slide(motion)


func _on_Player_direct(direction, field):
	var f = field.instance()
	add_child(f)
