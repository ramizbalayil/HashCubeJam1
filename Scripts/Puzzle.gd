extends GridContainer

onready var puzzle = preload("res://Assets/Images/test_puzzle.png")
onready var empty_cell = preload("res://Assets/Images/empty_cell.png")
onready var cell_scene = preload("res://Scenes/Cell.tscn")
onready var puzzle_size = Vector2(puzzle.get_width(), puzzle.get_height())
onready var divider = 3
onready var cell_width = puzzle_size.x / divider
onready var cell_height = puzzle_size.y / divider


func _ready():
	set_up_puzzle_grid()
	add_texture_to_grid()
	pass

func set_up_puzzle_grid():
	self.rect_min_size = puzzle_size
	self.margin_left = puzzle_size.x / 2 * -1
	self.margin_top = puzzle_size.y / 2 * -1
	self.margin_right = puzzle_size.x / 2 * 1
	self.margin_bottom = puzzle_size.y / 2 * 1

func add_texture_to_grid():
	var cell_count = 0
	for i in range(0, divider):
		for j in range(0, divider):
			var cell = cell_scene.instance()
			cell.rect_min_size = Vector2(cell_width, cell_height)
			cell.set_cell(i, j)
			cell.set_value(cell_count, puzzle)
			cell_count += 1
			add_child(cell)

	var cell = cell_scene.instance()
	cell.rect_min_size = Vector2(cell_width, cell_height)
	cell.set_cell(divider, 0)
	cell.set_value(-1, empty_cell)
	add_child(cell)

func get_neighbors(row, col):
	var neighbors = []
	if (row + 1 < divider):
		neighbors.push_front(get_cell(row + 1, col))
	if (row - 1 > -1):
		neighbors.push_front(get_cell(row - 1, col))
	if (col + 1 < divider + 1):
		neighbors.push_front(get_cell(row, col + 1))
	if (col - 1 > -1):
		neighbors.push_front(get_cell(row, col - 1))

	return neighbors

func get_cell(row, col):
	return get_child(row * divider + col)


