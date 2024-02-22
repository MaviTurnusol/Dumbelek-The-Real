extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	TheSocket.connect("connected", self, "_on_WebsocketServer_connected")
	if(!State.testdone):
		text = "Waiting for remote connection...\nHint: Your IP is" + "\n" + IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
	else:
		text = ""
	pass # Replace with function body.


func _process(delta):
	pass


func _on_WebsocketServer_connected(to_url):
	$"../../AnimationPlayer".play("Start")
	pass # Replace with function body.
