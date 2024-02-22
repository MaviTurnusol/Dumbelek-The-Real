extends AudioStreamPlayer

export var bpm = 80
export var measures := 2
var songPos = 0.0
var songPosInBeats = 1
var beatsBeforeStart = 0
var lastReportedBeat = 0
var secPerBeat = 60.0 / bpm

var closest = 0
var measure = 1
var timeOffBeat = 0.0
var firstLag = true

signal sbeat(position)
signal smeasure(position)
# Called when the node enters the scene tree for the first time.
func _ready():
	State.conductor = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing:
		songPos = get_playback_position() + AudioServer.get_time_since_last_mix()
		songPos -= AudioServer.get_output_latency()
		songPosInBeats = int(floor(songPos / secPerBeat)) + beatsBeforeStart
		_report_beat()
	pass
	
func _report_beat():
	if lastReportedBeat < songPosInBeats:
		if measure > measures:
			measure = 1
		emit_signal("sbeat", songPosInBeats)
		emit_signal("smeasure", measure)
		lastReportedBeat = songPosInBeats
		measure += 1

func play_with_beat_offset(num):
	beatsBeforeStart = num
	$StartTimer.wait_time = secPerBeat
	$StartTimer.start()


func closest_beat(nth):
	closest = int(round((songPos / secPerBeat) / nth) * nth) 
	timeOffBeat = abs(closest * secPerBeat - songPos)
	return Vector2(closest, timeOffBeat)


func play_from_beat(beat, offset):
	play()
	seek(beat * secPerBeat)
	beatsBeforeStart = offset
	measure = beat % measures

func _on_start_timer_timeout():
	songPosInBeats += 1
	if songPosInBeats < beatsBeforeStart - 1:
		$StartTimer.start()
	elif songPosInBeats == beatsBeforeStart - 1:
		$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() +
														AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	if(firstLag):
		$"../../LagTimer".start()
	else:
		_report_beat()

func _on_LagTimer_timeout():
	_report_beat()
	firstLag = false
	pass # Replace with function body.
