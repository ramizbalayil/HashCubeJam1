extends Panel

var value = -1
var row = -1
var col = -1
var cell_width = 0
var cell_height = 0

signal cell_selected

func _ready():
	connect("cell_selected", self.get_parent(), "_on_cell_selected")


func set_cell(val, r, c, tex):
	value = val
	row = r
	col = c
	cell_width = rect_min_size.x
	cell_height = rect_min_size.y
	$cell_image.set_texture(tex)

func is_cell_free():
	return value != -1

func set_image():
	$cell_image.region_rect = Rect2(cell_width * col, cell_height * row, cell_width, cell_height)
	var shape = RectangleShape2D.new()
	$Area2D.position.x += cell_width / 2
	$Area2D.position.y += cell_height / 2
	shape.extents = Vector2(cell_width / 2, cell_height / 2)
	$Area2D/CollisionShape2D.shape = shape


func _on_Area2D_input_event(viewport, event, shape_idx):
#	emit_signal("cell_selected", self)
	print("hit")
