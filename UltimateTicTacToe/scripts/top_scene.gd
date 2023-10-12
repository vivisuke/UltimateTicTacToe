extends Node2D

const disabled_mess = [
	"ばぶばぶー", "もっと強くなってから出直して来てね", "俺と対戦するのは100年早いぜ",
	"余と対戦したいとは無礼者め", "もっと修行して出なおしてきてね", "余の辞書にはまだ「対戦」という文字は無い",
	"もっと実績をつんできてね", "神は対戦は早過ぎると言っている", "まだまだだな",
]
const disabled_mess_en = [
	"goo goo ga ga", "Please come back after becoming stronger.", "It will be 100 years before you fight me.",
	"You are a rude person who wants to play against me.", "Please train more and come out again.", "My dictionary doesn't have the word 'battle' yet.",
	"Please accumulate more achievements.", "God says it's too early to fight", "There's still a long way to go",
]
const enabled_mess = [
	"    ばぶばぶばぶー？    ", "わたしと対戦したいの？", "俺と対戦するとはいい度胸だ",
	"余と対戦したいと申すのか？", "わたしが強すぎても後悔しない？", "余の辞書に「敗北」の文字は無いがよいか？",
	"わたしが強すぎても後悔しない？", "　　神は対戦を認めたのか？　　", "相手を全員倒してきたのか？",
]
const enabled_mess_en = [
	"    goo goo ga ga ?    ", "do you want to play against me ?", "You have the nerve to play against me.",
	"Are you saying you want to play against me ?", "Even if I'm too strong, won't you regret it ?", "Is it okay if I don't have the word 'defeat' in my dictionary ?",
	"Even if I'm too strong, won't you regret it ?", "Did God approve of the match ?", "Have you defeated all your opponents ?",
]
var pressed_oppix = -1
var opp_list = []

func _ready():
	$HBCLang/JpButton.set_pressed_no_signal(g.lang_jp)
	$HBCLang/EnButton.set_pressed_no_signal(!g.lang_jp)
	build_opp_lst()
	for ix in range(opp_list.size()):
		opp_list[ix].disabled = g.opp_disabled[ix]
	update_message()
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
func update_message():
	if g.lang_jp:
		$MessLabel.text = "一覧から対戦相手をタップしてください。"
	else:
		$MessLabel.text = "Please tap your opponent from the list."
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
	$AcceptDialog.dialog_text = disabled_mess[ix] if g.lang_jp else disabled_mess_en[ix]
	#$AcceptDialog.connect("confirmed", on_confirmed)
	$AcceptDialog.show()
	var sz = $AcceptDialog.size
	$AcceptDialog.position = Vector2(250 - sz.x/2, 400)
	pass

func on_confirmed():
	print("on_confirmed()")
	get_tree().change_scene_to_file("res://main_scene.tscn")


func _on_texture_button_12_button_down():
	print("button_down()")
	pass # Replace with function body.
func on_opp_button_pressed(ix):
	#$ConfirmationDialog.title = ""
	$ConfirmationDialog.dialog_text = enabled_mess[ix] if g.lang_jp else enabled_mess_en[ix]
	$ConfirmationDialog.ok_button_text = "Yes"
	$ConfirmationDialog.connect("confirmed", on_confirmed)
	$ConfirmationDialog.show()
	var sz = $ConfirmationDialog.size
	$ConfirmationDialog.position = Vector2(250 - sz.x/2, 400)
	pass # Replace with function body.
func _on_texture_button_11_pressed():
	on_opp_button_pressed(0)
func _on_texture_button_12_pressed():
	on_opp_button_pressed(1)
func _on_texture_button_13_pressed():
	on_opp_button_pressed(2)
func _on_texture_button_21_pressed():
	on_opp_button_pressed(3)
func _on_texture_button_22_pressed():
	on_opp_button_pressed(4)
func _on_texture_button_23_pressed():
	on_opp_button_pressed(5)
func _on_texture_button_31_pressed():
	on_opp_button_pressed(6)
func _on_texture_button_32_pressed():
	on_opp_button_pressed(7)
func _on_texture_button_33_pressed():
	on_opp_button_pressed(8)


func _on_jp_button_toggled(button_pressed):
	$HBCLang/EnButton.set_pressed_no_signal(!button_pressed)
	g.lang_jp = button_pressed
	update_message()


func _on_en_button_toggled(button_pressed):
	$HBCLang/JpButton.set_pressed_no_signal(!button_pressed)
	g.lang_jp = !button_pressed
	update_message()
