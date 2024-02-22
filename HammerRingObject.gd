extends Area2D

var target
var dis_to_target
var speed
var hit = false

func _physics_process(delta):
	dis_to_target = (global_position.x - 950)
	speed = dis_to_target / 2.0
	if(!hit):
		$CollisionShape2D.position.x += speed * delta
		$Sprite.scale.x += speed * delta / 300
		$Sprite.scale.y += speed * delta / 300
	else:
		$CollisionShape2D.position.x -= speed * delta
		$Sprite.scale.x -= speed * delta * 1.2 / 1200
		$Sprite.scale.y -= speed * delta * 1.2 / 1200
		$Sprite.modulate.a -= 0.1
		print("balls")

func destroy():
	$Timer.start()
	hit = true

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
