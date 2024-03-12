extends Node

var cursor = preload("res://art/cursor/mouse.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	$TextureRect.visible = false
	$StartButton.visible = false
	$StartButton/Label.visible = false
	
	# Start the level
	$Level/Spawner/SpawnTimer.start()
	$HUD/Time/Timer.start()


func _on_start_button_mouse_entered():
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(16, 16))


func _on_start_button_mouse_exited():
	Input.set_custom_mouse_cursor(null)
