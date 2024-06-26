extends RigidBody2D
var mouse_inside = false
var click = false
var velocity = Vector2(0,0)
var jump_distance = Vector2(0,0)
var position1 = Vector2(0,0)
var position2 = Vector2(0,0)
var x_clamp_value = 900
var y_clamp_value = 1500

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
	if event is InputEventMouseButton and event.get_button_index ( ) == 1 and is_equal_approx(0, self.linear_velocity.x) and is_equal_approx(0, self.linear_velocity.y):
		if event.is_pressed() and mouse_inside == true:
			click = true
			position1 = get_viewport().get_mouse_position()
		if event.is_released() and click == true:
			click = false
			position2 = get_viewport().get_mouse_position()
			velocity = (position1 - position2)*5
			velocity = Vector2(clamp(velocity.x, -x_clamp_value, x_clamp_value),clamp(velocity.y, -y_clamp_value,y_clamp_value))
			apply_impulse(velocity, Vector2.ZERO)

