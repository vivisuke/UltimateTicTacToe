extends Node2D

const disabled_mess = [
	"ばぶばぶー", "もっと強くなってから出直して来てね", "俺と対戦するのは100年早いぜ",
	"余と対戦したいとは無礼者め", "もっと修行して出なおしてきてね", "余の辞書にはまだ「対戦」という文字は無い",
	"もっと実績をつんできてね", "神は対戦は早過ぎると言っている", "まだまだだな",
]
const enabled_mess = [
	"　　ばぶばぶばぶー？　　", "わたしと対戦したいの？", "俺と対戦するとはいい度胸だ",
	"余と対戦したいと申すのか？", "わたしが強すぎても後悔しない？", "余の辞書に「敗北」の文字は無いがよいか？",
	"わたしが強すぎても後悔しない？", "　　神は対戦を認めたのか？　　", "相手を全員倒してきたのか？",
]
var pressed_oppix = -1
var opp_list = []

func _ready():
	build_opp_lst()
	pass # Replace with function body.
func build_opp_lst():
	opp_list.push_back($HBC1/TextureButton11)
	opp_list.push_back($HBC1/TextureButton12)
	opp_list.push_back($HBC1/TextureButton13)
	opp_list.push_back($HBC2/TextureButton21)
	opp_list.push_back($HBC2/TextureButton22)
	opp_list.push_back($HBC2/TextureButton23)
	opp_list.push_back($HBC3/TextureButton31)
	opp_list.push_back($HBC3/TextureButton32)
	opp_list.push_back($HBC3/TextureButton33)
func pos_to_oppix(pos):
	for ix in range(opp_list.size()):
		var rct = opp_list[ix].get_global_rect()
		if rct.has_point(pos):
			return ix
	return -1
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		print("InputEventMouseButton")
		var mp : Vector2 = get_global_mouse_position()
		var ix = pos_to_oppix(mp)
		print("ix = ", ix)
		if event.is_pressed():
			pressed_oppix = ix
		else:
			if ix == pressed_oppix && g.opp_disabled[ix]:
				show_disabled_mess(ix)
			pressed_oppix = -1

func show_disabled_mess(ix):
	$AcceptDialog.dialog_text = disabled_mess[ix]
	#$AcceptDialog.connect("confirmed", on_confirmed)
	$AcceptDialog.show()
	var sz = $AcceptDialog.size
	$AcceptDialog.position = Vector2(250 - sz.x/2, 400)
	pass
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
	get_tree().change_scene_to_file("res://main_scene.tscn")


func _on_texture_button_12_button_down():
	print("button_down()")
	pass # Replace with function body.
