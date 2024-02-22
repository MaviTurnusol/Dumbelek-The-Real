extends Area2D

var speed = 0
var hit = false
var TargetPos
var LocalDir

var RightSpawnpoint = Vector2(612, 462)
var LeftSpawnpoint = Vector2(412, 462)
var RightTargetPos = Vector2(936, 462)
var LeftTargetPos = Vector2(88, 462)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if(!hit): position.x += speed * delta
	pass

func initialize(direction):
	if(direction == 0):
		global_position = LeftSpawnpoint
		TargetPos = LeftTargetPos
		speed = (TargetPos.x - LeftSpawnpoint.x) / 2.0
	elif(direction == 1):
		global_position = RightSpawnpoint
		TargetPos = RightTargetPos
		$Sprite.flip_h = true
		speed = (TargetPos.x - RightSpawnpoint.x) / 2.0
	LocalDir = direction

func destroy():
	hit = true
	$DestroyTimer.start()
	$AnimationPlayer.play("fade_out")
	set_physics_process(false)

func _on_DestroyTimer_timeout():
	queue_free()
	pass # Replace with function body.
