extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Channels_mouse_entered():
	self.modulate = Color.yellow
	pass # Replace with function body.


func _on_Channels_mouse_exited():
	self.modulate = Color.white
	pass # Replace with function body.



func _on_DumbES_mouse_entered():
	$"../DumbES/TheText".modulate = Color.yellow
	pass # Replace with function body.


func _on_DumbES_mouse_exited():
	$"../DumbES/TheText".modulate = Color.white
	pass # Replace with function body.


func _on_Settings_mouse_entered():
	$"../Settings".modulate = Color.yellow
	pass # Replace with function body.


func _on_Settings_mouse_exited():
	$"../Settings".modulate = Color.white
	pass # Replace with function body.


func _on_Exit_mouse_entered():
	$"../Exit".modulate = Color.yellow
	pass # Replace with function body.


func _on_Exit_mouse_exited():
	$"../Exit".modulate = Color.white
	pass # Replace with function body.


func _on_Channels_pressed():
	_click_sfx()
	var rythmScene = load("res://GameScene.tscn")
	get_tree().change_scene_to(rythmScene)
	pass # Replace with function body.

func _click_sfx():
	var Click = load("res://Click.tscn").instance()
	add_child(Click)
