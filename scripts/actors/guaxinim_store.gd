extends Area2D
@onready var store = %Store

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape") && store.visible:
		store.hide()
		get_tree().paused = false

func _input(event):
	if event.is_action_pressed("ui_accept") && len(get_overlapping_bodies()) > 0: 
		
		if LevelCore.life_bonus > 0:
			%BuyButton1.text = "adquirido"
			%BuyButton1.disabled = true
		
		if LevelCore.bullet_fire_rate_bonus > 1:
			%BuyButton2.text = "adquirido"
			%BuyButton2.disabled = true
			
		if LevelCore.bullet_fire_rate_bonus > 1:
			%BuyButton3.text = "adquirido"
			%BuyButton3.disabled = true
		
		if LevelCore.coins < 10:
			%BuyButton1.disabled = true

		if LevelCore.cans < 20:
			%BuyButton2.disabled  = true

		if LevelCore.waterbottles < 20:
			%BuyButton3.disabled = true

		store.show()
		get_tree().paused = true
		await get_tree().create_timer(0.3).timeout
		%BuyButton1.grab_focus()

func _on_close_button_pressed() -> void:
	store.hide()
	get_tree().paused = false


func _on_buybutton_1_pressed() -> void:
	SoundManager.buy_sound.play()
	LevelCore.coins -= 10
	LevelCore.life_bonus = 2
	%BuyButton1.text = "adquirido"
	%BuyButton1.disabled = true

func _on_buybutton_2_pressed() -> void:
	SoundManager.buy_sound.play()
	LevelCore.cans -= 20
	LevelCore.bullet_fire_rate_bonus = 1.5
	%BuyButton2.text = "adquirido"
	%BuyButton2.disabled = true

func _on_buybutton_3_pressed() -> void:
	SoundManager.buy_sound.play()
	LevelCore.waterbottles -= 20
	LevelCore.bullet_speed_bonus = 1.5
	%BuyButton3.text = "adquirido"
	%BuyButton3.disabled = true
