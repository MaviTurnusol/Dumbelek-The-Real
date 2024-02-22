extends Label

var channel = 0
var chName = "Null"

func _process(_delta):
	text = "Channel " + str(channel) + ": " + chName

func channel_change(dir):
	if(channel < 9 && dir == 1):
		channel += 1
	if(channel > 1 && dir == -1):
		channel -= 1
	if(channel == 9 && dir == 1):
		channel = 1
	if(channel == 1 && dir == -1):
		channel = 9
	match channel:
		0:
			chName = "Null"
			$"../../CanvasLayer/milkyway tv".visible = false
		1:
			$"../../CanvasLayer/btv".visible = true
			$"../../CanvasLayer/fly tv".visible = false
			$"../../CanvasLayer/cartoon networth".visible = false
			$"../../CanvasLayer/milkyway tv".visible = false
			chName = "BTV"
		2:
			$"../../CanvasLayer/fly tv".visible = true
			$"../../CanvasLayer/btv".visible = false
			$"../../CanvasLayer/new tv".visible = false
			$"../../CanvasLayer/milkyway tv".visible = false
			chName = "FLY TV"
		3:
			$"../../CanvasLayer/new tv".visible = true
			$"../../CanvasLayer/wound tv".visible = false
			$"../../CanvasLayer/fly tv".visible = false
			$"../../CanvasLayer/milkyway tv".visible = false
			chName = "BOX TV"
		4:
			$"../../CanvasLayer/wound tv".visible = true
			$"../../CanvasLayer/new tv".visible = false
			$"../../CanvasLayer/quiz tv".visible = false
			$"../../CanvasLayer/milkyway tv".visible = false
			chName = "Wound TV"
		5:
			$"../../CanvasLayer/quiz tv".visible = true
			$"../../CanvasLayer/wound tv".visible = false
			$"../../CanvasLayer/what".visible = false
			$"../../CanvasLayer/milkyway tv".visible = false
			chName = "Quiz TV"
		6:
			$"../../CanvasLayer/what".visible = true
			$"../../CanvasLayer/display tv".visible = false
			$"../../CanvasLayer/quiz tv".visible = false
			$"../../CanvasLayer/milkyway tv".visible = false
			chName = "WHAT"
		7:
			$"../../CanvasLayer/display tv".visible = true
			$"../../CanvasLayer/what".visible = false
			$"../../CanvasLayer/milkyway tv".visible = false
			chName = "Expose"
		8:
			$"../../CanvasLayer/milkyway tv".visible = true
			$"../../CanvasLayer/display tv".visible = false
			$"../../CanvasLayer/cartoon networth".visible = false
			chName = "Milkyway TV"
		9:
			$"../../CanvasLayer/cartoon networth".visible = true
			$"../../CanvasLayer/milkyway tv".visible = false
			$"../../CanvasLayer/btv".visible = false
			chName = "Cartoon Networth"
