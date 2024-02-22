extends Node2D

var currentCircle = []
var jsSpawned = false
	
func hit_ring():
		for area in currentCircle.size():
			if(is_instance_valid(currentCircle[area])):
				currentCircle[area].destroy()

func _on_Hitbox_area_entered(area):
	if(area.is_in_group("ring")):
		currentCircle.append(area)
	pass # Replace with function body.

func _on_LossBox_area_entered(area):
	if(area.is_in_group("ring")):
			area.destroy()
			State.jsmeter += 5
			if(State.jsmeter >= 30 && State.undying == false):
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
