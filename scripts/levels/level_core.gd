extends Node

const SAVE_FILE = "user://savefile.dat"

var coins := 0;
var cans := 0;
var waterbottles := 0;

var life_bonus = 0;
var bullet_speed_bonus = 1;
var bullet_fire_rate_bonus = 1;

var player_position: Vector2 = Vector2.ZERO;

class River:
	var level_1_completed = false
	var level_1_first_play = true

	var level_2_completed = false
	var level_2_first_play = true

	var level_3_completed = false
	var level_3_first_play = true

var river := River.new()

var levels_pause_avaliable = true

var data = {}

func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	data = {
		"coins" = coins,
		"cans" = cans,
		"waterbottles" = waterbottles,
		"life_bonus" = life_bonus,
		"bullet_speed_bonus" = bullet_speed_bonus,
		"bullet_fire_rate_bonus" = bullet_fire_rate_bonus,
		"player_position" = player_position,
		"levels_pause_avaliable" = levels_pause_avaliable,
		"river" = {
			"level_1_completed"= river.level_1_completed,
			"level_1_first_play"= river.level_1_first_play,
			
			"level_2_completed"= river.level_2_completed,
			"level_2_first_play"= river.level_2_first_play,
			
			"level_3_completed"= river.level_3_completed,
			"level_3_first_play"= river.level_3_first_play,
		}
	}
	
	file.store_var(data)
	file = null
	
func load_data():
	
	if not FileAccess.file_exists(SAVE_FILE):
		save_data()
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	
	data = file.get_var()
	
	coins = data.coins
	cans = data.cans
	waterbottles = data.waterbottles
	life_bonus = data.life_bonus
	bullet_speed_bonus = data.bullet_speed_bonus
	bullet_fire_rate_bonus = data.bullet_fire_rate_bonus
	player_position = data.player_position
	levels_pause_avaliable = data.levels_pause_avaliable
	
	river.level_1_completed = data.river.level_1_completed
	river.level_1_first_play = data.river.level_1_first_play
	
	river.level_2_completed = data.river.level_2_completed
	river.level_2_first_play = data.river.level_2_first_play
	
	river.level_3_completed = data.river.level_3_completed
	river.level_3_first_play = data.river.level_3_first_play
	
	file = null
