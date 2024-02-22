extends Node

var player
var conductor
var controller
var channel = 0
var undying = false

var combo = 0
var jsmeter = 0
var testdone = false
var jsbarcame = false

var peerid
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(OS.get_name() == "Windows" || OS.get_name() == "MacOS"):
		OS.window_size = Vector2(1024, 600)
	pass # Replace with function body.

func _process(delta):
	if(jsmeter < 0):
		jsmeter = 0
	pass
