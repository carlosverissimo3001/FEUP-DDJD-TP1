extends CanvasLayer

const neededPlayers = 8
const red = Color(1.0, 0.0, 0.0, 1.0)

var time_elapsed: float = 0

# dark green
const green = Color(0.0, 0.5, 0.0, 1.0)

var currPlayerCount = 0
var finishedPlayerCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerCount/InScene.text = "00"
	$PlayerCount/Needed.text = "/ 0" + str(neededPlayers)

	# Change text color to red
	$PlayerCount/Finished.set("theme_override_colors/font_color", red)

	# Start time
	$Time/Timer.start()

func _updatePlayers(playerCount):
	currPlayerCount = playerCount
	$PlayerCount/InScene.text = _format_number(playerCount)

func _updateFinishedPlayers():
	finishedPlayerCount += 1
	$PlayerCount/Finished.text = _format_number(finishedPlayerCount)

	currPlayerCount -= 1
	$PlayerCount/InScene.text = _format_number(currPlayerCount)

	if finishedPlayerCount == neededPlayers:
		$PlayerCount/Finished.set("theme_override_colors/font_color", green)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta

	# Update time label
	_updateTimeLabel()

func _updateTimeLabel():
	$Time/TimeString.text = _format_time(time_elapsed)

func _on_timer_timeout():
	pass # Replace with function body.

func _format_number(num: int) -> String:
	if num >= 0 and num < 10:
		return "0" + str(num)
	else:
		return str(num)

func _format_time(time: float) -> String:
	var mins = int(time) / 60
	time -= mins * 60
	var secs = int(time)

	return _format_number(mins) + ":" + _format_number(secs)
