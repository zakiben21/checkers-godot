#
# Individual piece logic
#

extends Area2D

var color
var pos
var selected = false

onready var sprite = get_node("sprite")
onready var tilemap = get_node("../board")
onready var label = get_node("../text")

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		global.selected_piece_pos = tilemap.world_to_map(pos)
		global.selected_piece_name = self.get_name()

func _mouse_enter():
	sprite.set_scale(Vector2(1.1, 1.1))

func _mouse_exit():
	sprite.set_scale(Vector2(1, 1))

func _ready():
	self.set_process(true)

func _process(delta):
	pos = self.get_pos()
	print(self.get_parent())
	if global.selected_piece_pos == tilemap.world_to_map(pos):
		selected = true
	else:
		selected = false
	
	if selected:
		sprite.set_modulate(Color(1.2, 1, 1, 1))
		label.set_text(str("selected: ", global.selected_piece_name, " at ", global.selected_piece_pos))
	else:
		sprite.set_modulate(Color(1, 1, 1, 1))
		

