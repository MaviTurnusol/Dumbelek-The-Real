extends Node2D

var currentNote = []
var okay
var good
var perfect
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hit_note():
		for area in currentNote.size():
			if(is_instance_valid(currentNote[area])):
				currentNote[area].destroy()
				$"../ChannelShow".channel_change(-1)
		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OkayArea_area_entered(area):
	if(area.is_in_group("note")):
		currentNote.append(area)
		okay = true
	pass # Replace with function body.


func _on_GoodArea_area_entered(area):
	if(area.is_in_group("note")):
		good = true
	pass # Replace with function body.


func _on_PerfectArea_area_entered(area):
	if(area.is_in_group("note")):
		perfect = true
	pass # Replace with function body.


func _on_OkayArea_area_exited(area):
	if(area.is_in_group("note")):
		currentNote.pop_back()
	pass # Replace with function body.
