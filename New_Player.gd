extends KinematicBody2D

# Declare member variables here. Examples:
export (float) var spd = 120;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var motion = Vector2.ZERO;
	
	if (Input.is_action_pressed("move_up")):
		motion += Vector2.UP;
	if (Input.is_action_pressed("move_down")):
		motion += Vector2.DOWN;
	if (Input.is_action_pressed("move_right")):
		motion += Vector2.RIGHT;
	if (Input.is_action_pressed("move_left")):
		motion += Vector2.LEFT;
		
	motion = motion.normalized();
	motion *= spd;
	move_and_slide(motion);
