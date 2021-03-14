extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var directionpush = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_direct(myx, myy, direction):
	if $Timer.time_left == 0:
		position.x = myx + 16
		position.y = myy + 16
		directionpush = direction
		$Timer.start()
func _on_Timer_timeout():
	position.x = -300
	position.y = -300
	