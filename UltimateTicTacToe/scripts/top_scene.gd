extends Node2D


var oppo_list = []

func _ready():
	build_oppo_lst()
	pass # Replace with function body.
func build_oppo_lst():
	oppo_list.push_back($HBC1/TextureButton11)
	oppo_list.push_back($HBC1/TextureButton12)
	oppo_list.push_back($HBC1/TextureButton13)
	oppo_list.push_back($HBC2/TextureButton21)
	oppo_list.push_back($HBC2/TextureButton22)
	oppo_list.push_back($HBC2/TextureButton23)
	oppo_list.push_back($HBC3/TextureButton31)
	oppo_list.push_back($HBC3/TextureButton32)
	oppo_list.push_back($HBC3/TextureButton33)
func pos_to_oppoix(pos):
	for ix in range(oppo_list.size()):
		var rct = oppo_list[ix].get_global_rect()
		if rct.has_point(pos):
			return ix
	return -1
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		print("InputEventMouseButton")
		var mp : Vector2 = get_global_mouse_position()
		var ix = pos_to_oppoix(mp)
		print("ix = ", ix)


func _on_texture_button_11_pressed():
	#$ConfirmationDialog.title = ""
	$ConfirmationDialog.dialog_text = "ばぶばぶー"
	$ConfirmationDialog.ok_button_text = "Yes"
	$ConfirmationDialog.connect("confirmed", on_confirmed)
	$ConfirmationDialog.show()
	var sz = $ConfirmationDialog.size
	$ConfirmationDialog.position = Vector2(250 - sz.x/2, 400)

	pass # Replace with function body.

func on_confirmed():
	print("on_confirmed()")


func _on_texture_button_12_button_down():
	print("button_down()")
	pass # Replace with function body.
