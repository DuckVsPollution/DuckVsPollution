extends Node

var coleta: AudioStreamPlayer
var level_complete_sound: AudioStreamPlayer
var buy_sound: AudioStreamPlayer
var audio_player: AudioStreamPlayer
var default_focus_sound: AudioStreamPlayer
var background_music_player: AudioStreamPlayer
var background_musics: Dictionary[String, AudioStream]
var current_background_music_key: String

func _ready():
	
	background_musics = {
		"default": load("res://assets/sounds/Ilha.ogg"),
		"boss_fight": load("res://assets/sounds/Boss.ogg")
	}
	
	buy_sound = AudioStreamPlayer.new()
	buy_sound.bus = 'Efects'
	buy_sound.stream = load("res://assets/sounds/Compras.ogg")
	buy_sound.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(buy_sound)
	
	level_complete_sound = AudioStreamPlayer.new()
	level_complete_sound.bus = 'Efects'
	level_complete_sound.stream = load("res://assets/sounds/FaseConcluida.ogg")
	level_complete_sound.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(level_complete_sound)
	
	coleta = AudioStreamPlayer.new()
	coleta.bus = 'Efects'
	coleta.stream = load("res://assets/sounds/Coletar.ogg")
	coleta.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(coleta)
	
	default_focus_sound = AudioStreamPlayer.new()
	default_focus_sound.bus = 'Efects'
	default_focus_sound.stream = load("res://assets/sounds/MenuNavegando.ogg")
	default_focus_sound.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(default_focus_sound)
	
	background_music_player = AudioStreamPlayer.new()
	background_music_player.bus = 'Musics'
	background_music_player.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(background_music_player)
	set_background_music("default")

	get_tree().node_added.connect(_on_node_added)

func set_background_music(music_key: String):
	
	if music_key != current_background_music_key:
		background_music_player.stream = background_musics.get(music_key)
		background_music_player.play()
		current_background_music_key = music_key

func _on_node_added(node: Node):
	if node is Button:
		node.focus_entered.connect(func(): _play_focus_sound())

func _play_focus_sound():
	if default_focus_sound:
		default_focus_sound.play()
