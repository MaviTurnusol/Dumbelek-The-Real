extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var speed_dir = Vector2(0, 400)
	move_and_slide(speed_dir)
	pass

func destroy():
	set_physics_process(false)
	queue_free()
