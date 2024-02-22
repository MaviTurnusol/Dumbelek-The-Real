extends Node

var score = 0
var combo = 0

var bpm = 80

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = 0
var spawn_2_beat = 1
var spawn_1_beat_1 = 0
var spawn_2_beat_1 = 0
var spawn_1_beat_2 = 0
var spawn_2_beat_2 = 0
var spawn_1_beat_4 = 0
var spawn_2_beat_4 = 0

var spawn_ring_1 = 0
var spawn_ring_2 = 0
var hammer

var secondary = false

var lane = 0
var rand = 0
var note = load("res://Note.tscn")
var instance

var hammerToggle = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$"1".wait_time = sec_per_beat - 0.01
	$"1_2".wait_time = sec_per_beat/2
	$"1_4".wait_time = sec_per_beat/4

func _on_Conductor_smeasure(position):
	if(spawn_1_beat == 1):
		_spawn_notes(0)
	if(spawn_2_beat == 1):
		_spawn_notes(1)
	if(spawn_ring_1):
		spawn_ring()
	if(spawn_1_beat_2 || spawn_2_beat_2 == 1 || spawn_ring_2):
		$"1_2".start()
	if(spawn_1_beat_4 || spawn_2_beat_4 == 1):
		$"1_4".start()
	if(spawn_1_beat_1 || spawn_2_beat_1 == 1):
		if(secondary):
			_spawn_notes(1)
			secondary = false
		else:
			_spawn_notes(0)
			secondary = true
	
func _on_Conductor_sbeat(position):
	song_position_in_beats = position
	if song_position_in_beats > 4:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 48:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 55:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 1
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 63:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 72:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats == 76: $"../siren/theSiren".play("sirencall")
	if song_position_in_beats > 76:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats == 79:
		hammerin(true)
		$"../HammerTime/HammerAnim".play("HammerEnter")
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 92:
		spawn_ring_1 = 1
	if song_position_in_beats > 101:
		spawn_ring_1 = 1
		spawn_ring_2 = 1
	if song_position_in_beats > 103:
		spawn_ring_1 = 1
		spawn_ring_2 = 0
	if song_position_in_beats > 116:
		spawn_ring_1 = 1
		spawn_ring_2 = 1
	if song_position_in_beats > 118:
		spawn_ring_1 = 1
		spawn_ring_2 = 0
	if song_position_in_beats > 132:
		spawn_ring_1 = 0
		spawn_ring_2 = 1
	if song_position_in_beats > 136:
		spawn_ring_1 = 0
		spawn_ring_2 = 0
	if song_position_in_beats >= 138:
		spawn_ring_1 = 1
		spawn_ring_2 = 1
		State.undying = true
	if song_position_in_beats > 139:
		spawn_ring_1 = 0
		spawn_ring_2 = 0
	if song_position_in_beats == 142:
		spawn_ring_1 = 0
		spawn_ring_2 = 0
		$"../HammerStatic".play("Static Crush")
		$"../HammerTime/HammerAnim".play("ComeBottomBar")
		$"../BottomBar".visible = true
		$"../HammerTime".visible = false
		$"../HammerButton".visible = false
	if song_position_in_beats > 142:
		spawn_ring_1 = 0
		spawn_ring_2 = 0
	if song_position_in_beats == 147: hammerin(false)
	if song_position_in_beats > 149:
		State.undying = false
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 157:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 163:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 167:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 180:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 1
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 184:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 188:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 192:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 1
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 193:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 194:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 198:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 208:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 1
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 209:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 238:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 242:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 246:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 250:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 254:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 258:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats > 270:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
	if song_position_in_beats == 273:
		$"../HammerTime/HammerAnim".play("HammerEnter")
		hammerin(true)
	if song_position_in_beats > 286:
		spawn_ring_1 = 1
		spawn_ring_2 = 1
	if song_position_in_beats > 290:
		spawn_ring_1 = 1
		spawn_ring_2 = 0
	if song_position_in_beats > 293:
		spawn_ring_1 = 1
	if song_position_in_beats > 302:
		spawn_ring_1 = 1
		spawn_ring_2 = 1
	if song_position_in_beats > 306:
		spawn_ring_1 = 1
		spawn_ring_2 = 0
	if song_position_in_beats >= 332:
		spawn_ring_1 = 0
		spawn_ring_2 = 0
	if song_position_in_beats == 336:
		spawn_ring_1 = 0
		State.undying = true
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_1_beat_1 = 0
		spawn_2_beat_1 = 0
		spawn_1_beat_2 = 0
		spawn_2_beat_2 = 0
		spawn_1_beat_4 = 0
		spawn_2_beat_4 = 0
		hammerin(false)
		$"../HammerTime/HammerAnim".play("End Anim")
		$"../HammerTime".visible = true
		$"../HammerButton".visible = false
func _spawn_notes(to_spawn):
	if to_spawn == 0:
		lane = to_spawn
		instance = note.instance()
		instance.initialize(0)
		add_child(instance)
	if to_spawn == 1:
		lane = to_spawn
		instance = note.instance()
		instance.initialize(1)
		add_child(instance)
	if to_spawn == 2:
		return

func reset_combo():
	combo = 0

func _process(delta):
	pass

func _on_1_2_timeout():
	if(spawn_1_beat_2 == 1):
		_spawn_notes(0)
	if(spawn_2_beat_2 == 1):
		_spawn_notes(1)
	if(spawn_ring_2 == 1):
		spawn_ring()
	pass # Replace with function body.


func _on_1_4_timeout():
	if(spawn_1_beat_4 == 1):
		_spawn_notes(0)
	if(spawn_2_beat_4 == 1):
		_spawn_notes(1)
	pass # Replace with function body.


func _on_1_timeout():
	if(!secondary):
		_spawn_notes(0)
		secondary = true
	if(secondary):
		_spawn_notes(1)
		secondary = false
	pass # Replace with function body.

func hammerin(huh):
	if(huh):
		var data = {
			"hammer_mode": true
		}
		TheSocket.server.get_peer(State.peerid).put_packet(str(JSON.print(data)).to_utf8())
		hammerToggle = true
	else:
		var data = {
			"hammer_mode": false
		}
		TheSocket.server.get_peer(State.peerid).put_packet(str(JSON.print(data)).to_utf8())
		hammerToggle = false

func spawn_ring():
	var ring = load("res://HammerRingObject.tscn").instance()
	ring.global_position = $"../HammerButton".global_position
	get_tree().root.add_child(ring)


func _on_HammerAnim_animation_finished(anim_name):
	if(anim_name == "End Anim"):
		var menu = load("res://Menu.tscn")
		get_tree().quit()
	pass # Replace with function body.
