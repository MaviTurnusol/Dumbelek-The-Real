extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_aniplay_animation_finished(anim_name):
	if(anim_name == "Intro"):
		var game = load("res://GameScene.tscn")
		get_tree().change_scene_to(game)
	pass # Replace with function body.
