extends PanelContainer

@export
var PlayerChatUser : Node2D


func _ready() -> void:
	PlayerChatUser.on_sent_message.connect(_on_player_sent_message)
	%TextInput.on_sent_text.connect(_on_text_input_sent_text)


func _on_player_sent_message(_sender: Variant, message: Variant) -> void:
	%TerminalContext.add_entry("Player", message)


func _on_text_input_sent_text(text: String) -> void:
	PlayerChatUser.send_message_to_nearest_user(text)
