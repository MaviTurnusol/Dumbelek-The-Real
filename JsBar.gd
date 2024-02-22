extends TextureProgress

func _ready():
	if(State.jsbarcame):
		self.set_position(Vector2(100, 131))
	else:
		self.set_position(Vector2(-300, 131))

func _process(_delta):
	value = State.jsmeter

func _on_Timer_timeout():
	State.jsmeter -= 1
