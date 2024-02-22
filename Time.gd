extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var time = Time.get_time_dict_from_system()
	text = str(time.hour) + ":" + str(time.minute)
	pass
