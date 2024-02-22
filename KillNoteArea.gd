extends Area2D

var jsSpawned = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KillNoteArea_area_entered(area):
	if(area.is_in_group("note")):
		area.destroy()
		State.jsmeter += 5
		if(State.jsmeter >= 12 && State.undying == false):
			randomize()
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var randnum = rng.randi_range(10, 100)
			print(randnum)
			if(State.jsmeter >= randnum):
				if(!jsSpawned):
					if!(get_tree().root.get_node("Jumpscare")):
						var js = load("res://Jumpscare.tscn").instance()
						get_tree().root.add_child(js)
						jsSpawned = true
	pass # Replace with function body.
