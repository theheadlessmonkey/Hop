extends RigidBody2D
var jump_distance = 0
var mouse_inside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_mouse_entered():
	mouse_inside = true

func _on_mouse_exited():
	mouse_inside = false

func _input(event):
	if event is InputEventMouseButton and event.get_button_index ( ) == 1 and mouse_inside == true:
		if event.is_pressed():
			print("click")
	elif event.is_pressed() and event.get_button_index ( ) == 1 and mouse_inside == false:
		print("release")
		
