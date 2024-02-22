extends Sprite

var TestStart = false
var Lag
var LagNote
var LagDistance = []
var SpawnedLagNote = 0
var canStartMap = false
var TestDone = false

func _ready():
	TheSocket.connect("new_accel_data", self, "_on_WebsocketServer_new_accel_data")
	if(State.testdone):
		$map/Conductor.play_with_beat_offset(0)
		$map.hammerin(false)

func _on_WebsocketServer_new_accel_data(data):
	var json_res = JSON.parse(data)
	
	#Click SFX
	var Click = load("res://Click.tscn").instance()
	add_child(Click)
	
	if(json_res.error != OK):
		print("ERROR PARSING NIGGA, LOOK AT THIS DAMN ERROR MAN: ", json_res.error)
		print(json_res.error_string)
		return
	if !(json_res.result is Dictionary): return
			
	if(json_res.result["up_pressed"]):
		$BottomBar/RightArrow.hit_note()
	if(json_res.result["down_pressed"]):
		$BottomBar/LeftArrow.hit_note()
	if(json_res.result["smash"]):
		$HammerButton.hit_ring()
		$HammerStatic.play("Static Crush")
		print("smashed")
		
	
	pass # Replace with function body.

func _on_LagTestTimer_timeout():
	if(SpawnedLagNote < 10):
		LagNote = load("res://TestNote.tscn").instance()
		$LagControl.add_child(LagNote)
		SpawnedLagNote += 1
	else:
		Lag = (sum_array(LagDistance) / LagDistance.size()) / Engine.get_frames_per_second()
		$LagTimer.wait_time = stepify(Lag, 0.01)
		$LagControl.event = false
		$AnimationPlayer.play("GetHereBottomBar")
		print(Lag)
		$LagTestTimer.queue_free()
	pass # Replace with function body.
	
static func sum_array(array):
	var sum = 0.0
	for element in array:
		 sum += element
	return sum

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "Start"):
		$map/Conductor.play_with_beat_offset(0)
