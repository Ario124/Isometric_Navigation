extends TileMap


export (Vector2) var room_size;
const VOID = 0;
const GROUND = 1;
const WALL = 2;

func _ready():
	randomize();
	var controller = room_size / 2;
	var direction = randi() % 4;
	var odds = randi() % 2;
	
	for i in 400:
		
		 set_cellv(controller, GROUND);
		 var vdir = Vector2.RIGHT.rotated(deg2rad(direction * 90));
		 if odds == 1:
			  direction = randi() % 4;
		 controller += vdir;
		 controller.x = clamp(controller.x, 0, room_size.x - 1);
		 controller.y = clamp(controller.y, 0, room_size.y - 1);
		 odds = randi() % 2;
