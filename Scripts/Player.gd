extends RigidBody2D
var mouse_inside = false
var click = false
var velocity = Vector2(0,0)
var jump_distance = Vector2(0,0)
var position1 = Vector2(0,0)
var position2 = Vector2(0,0)

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
	if event is InputEventMouseButton and event.get_button_index ( ) == 1 and is_equal_approx(0, self.linear_velocity.x):
		if event.is_pressed() and mouse_inside == true:
			click = true
			position1 = get_viewport().get_mouse_position()
		if event.is_released() and click == true:
			click = false
			position2 = get_viewport().get_mouse_position()
			velocity = position1 - position2
			apply_impulse(velocity*10, Vector2.ZERO)
