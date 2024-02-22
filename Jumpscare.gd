extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

func _process(delta):
	if(frame >= 12):
		stop()

func _on_Timer_timeout():
		State.testdone = true
		State.jsbarcame = true
		State.jsmeter = 0
		State.conductor.stop()
		queue_free()
		get_tree().reload_current_scene()


func _on_vanminut_timeout():
	play()
	pass # Replace with function body.
