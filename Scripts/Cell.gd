extends TextureButton

var value = -1
var row = -1
var col = -1
var cell_width = 0
var cell_height = 0


func set_cell(r, c):
	row = r
	col = c
	cell_width = rect_min_size.x
	cell_height = rect_min_size.y

func is_cell_free():
	return value == -1

func set_value(val, tex):
	value = val
	set_image(tex)

func set_image(tex):
	$cell_image.set_texture(tex)
	$cell_image.region_rect = Rect2(cell_width * col, cell_height * row, cell_width, cell_height)

func _on_Cell_button_down():
	print("hitting: ", value)
	var neighbors = get_parent().get_neighbors(row, col)
	for i in range (0, neighbors.size()):
		if(neighbors[i].is_cell_free()):
			print(row)
			print(col)
			print("has free neighbor")
			print(neighbors[i].row)
			print(neighbors[i].col)
