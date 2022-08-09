extends TileMap


export (Vector2) var room_size;
const VOID = 0;
const GROUND = 1;
const WALL = 2;

func _ready():
	_generate_map()

func  _generate_map():
	
	randomize();
	var controller = room_size / 2;
	var direction = randi() % 4;
	var odds = randi() % 2;

	## Set all tiles to VOID ##
	for x in room_size.x:
		for y in room_size.y:
			set_cell(x, y, VOID);


	for i in 400:
		
		set_cellv(controller, GROUND);
		var vdir = Vector2.RIGHT.rotated(deg2rad(direction * 90));
		if odds == 1:
			direction = randi() % 4;
		controller += vdir;
		controller.x = clamp(controller.x, 0, room_size.x - 1);
		controller.y = clamp(controller.y, 0, room_size.y - 1);
		odds = randi() % 2;


	for x in room_size.x:
		for y in room_size.y:
			if get_cell(x, y) == GROUND:
				if get_cell(x, y-1) == VOID:
					set_cell(x, y-1, WALL);
				if get_cell(x-1, y) == VOID:
					set_cell(x-1, y, WALL);
