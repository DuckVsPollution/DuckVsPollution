extends Node

var coleta: AudioStreamPlayer

var level_complete_sound: AudioStreamPlayer

var buy_sound: AudioStreamPlayer

var audio_player: AudioStreamPlayer
var default_focus_sound: AudioStream

func _ready():
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
	
	default_focus_sound = load("res://assets/sounds/MenuNavegando.ogg")
	audio_player = AudioStreamPlayer.new()
	audio_player.bus = 'Efects'
	audio_player.process_mode = Node.PROCESS_MODE_ALWAYS

	add_child(audio_player)
	get_tree().node_added.connect(_on_node_added)

func _on_node_added(node: Node):
	if node is Button:
		node.focus_entered.connect(func(): _play_focus_sound())

func _play_focus_sound():
	if default_focus_sound:
		audio_player.stream = default_focus_sound
		audio_player.play()
