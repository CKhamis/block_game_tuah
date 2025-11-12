extends Area3D

var delta:Vector2
var held_object:Block = null
var select_pressed = false
@export var player_id:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	var x = Input.get_joy_axis(player_id, JOY_AXIS_LEFT_X)
	var y = Input.get_joy_axis(player_id, JOY_AXIS_LEFT_Y)
	delta.x = x
	delta.y = y
	
	#if event is InputEventJoypadMotion:
		#if event.axis == 0:
			#delta.x = event.axis_value
		#if event.axis == 1:
			#delta.y = event.axis_value
			
			
func _physics_process(dt: float) -> void:
	position += Vector3(delta.x, -delta.y, 0) * dt
	if delta.length() < .1:
		delta *= 0
	

	if Input.is_joy_button_pressed(player_id, JOY_BUTTON_A):
		if not select_pressed:
			select_pressed = true
		
			if is_instance_valid(held_object):
				# drop
				held_object.freeze = false
				held_object.reparent(get_parent(), true)
				held_object = null
			else:
				for body in get_overlapping_bodies():
					if body is Block:
						body.freeze = true
						held_object = body
						body.reparent(self, false)
						break
					if body is MenuBlock:
						body.pressed()
	else:
		select_pressed = false
	
