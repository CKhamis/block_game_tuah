class_name MenuBlock
extends RigidBody3D

@export var button_action:modes = modes.START
@onready var animation_player:=$"../AnimationPlayer"
@onready var animation_tree:=$"../AnimationTree"
@onready var label:=$"Label3D"
@export var button_name:String = "Block"

enum modes {
	START,
	OPTIONS,
	QUIT
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = button_name
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func pressed():
	match button_action:
		modes.START:
			get_tree().change_scene_to_file("res://test_world.tscn")
		modes.QUIT:
			get_tree().quit(0)
		modes.OPTIONS:
			# animation_tree.set("parameters/conditions/more_options_clicked", true)
			animation_player.play("more_options")
			print("rat")
