extends Control

@onready var play: Button = $CenterContainer/VBoxContainer/PLAY
@onready var settings: Button = $CenterContainer/VBoxContainer/SETTINGS
@onready var stats: Button = $CenterContainer/VBoxContainer/STATS
@onready var quit: Button = $CenterContainer/VBoxContainer/QUIT

@onready var click_sound: AudioStreamPlayer = $ClickSound
@onready var team_name: Label = $TeamName
@onready var flash: ColorRect = $ColorRect


func _ready():
	modulate.a = 0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 0.8)


	var t = create_tween()
	t.set_loops()
	t.tween_property(team_name, "modulate:a", 0.5, 1)
	t.tween_property(team_name, "modulate:a", 1, 1)



func animate_button(button, scale_to):
	var tween = create_tween()
	tween.tween_property(button, "scale", scale_to, 0.15)



func flash_effect():
	flash.modulate.a = 0.5
	var tween = create_tween()
	tween.tween_property(flash, "modulate:a", 0, 0.3)



func _on_play_pressed():
	click_sound.play()
	await click_sound.finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_play_mouse_entered():
	animate_button(play, Vector2(1.1,1.1))

func _on_play_mouse_exited():
	animate_button(play, Vector2(1,1))




func _on_settings_pressed():
	click_sound.play()
	print("SETTINGS")

func _on_settings_mouse_entered():
	animate_button(settings, Vector2(1.1,1.1))

func _on_settings_mouse_exited():
	animate_button(settings, Vector2(1,1))




func _on_stats_pressed():
	click_sound.play()
	print("STATS")

func _on_stats_mouse_entered():
	animate_button(stats, Vector2(1.1,1.1))

func _on_stats_mouse_exited():
	animate_button(stats, Vector2(1,1))




func _on_quit_pressed():
	click_sound.play()
	await click_sound.finished
	get_tree().quit()

func _on_quit_mouse_entered():
	animate_button(quit, Vector2(1.1,1.1))

func _on_quit_mouse_exited():
	animate_button(quit, Vector2(1,1))
