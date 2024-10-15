extends Node2D

var users_in_range = []

@export var user_name : String = ""

@export var should_log_chat_users : bool = false
@export var should_log_received_message : bool = false

signal on_received_message(send, message)

func send_message_to_nearest_user(message : String):
	if not users_in_range:
		return

	var nearest_user = null
	var nearest_user_range : float = 1000000
	for user in users_in_range:
		var distance = global_position.distance_to(user.global_position)
		if distance < nearest_user_range:
			nearest_user = user
			nearest_user_range = distance

	nearest_user.receive_message(self, message)

func send_message_to_all_users_in_range(message : String):
	if not users_in_range:
		return

	for user in users_in_range:
		user.receive_message(self, message)


func receive_message(sender : Node2D, message : String):
	if should_log_received_message:
		var time = Time.get_time_string_from_system()
		print(time, " - User: ", user_name, " received message: '", message, "' from: ", sender.user_name)
	
	on_received_message.emit(sender, message)
	

func _on_chat_user_entered(area: Area2D) -> void:
	users_in_range.append(area.owner)
	if should_log_chat_users:
		log_chat_users()


func _on_chat_user_exited(area: Area2D) -> void:
	users_in_range.erase(area.owner)
	if should_log_chat_users:
		log_chat_users()


func log_chat_users():
	var users_in_range_as_string = ""
	for user in users_in_range:
		users_in_range_as_string += " " + user.user_name
	users_in_range_as_string = users_in_range_as_string.erase(0, 1)

	print("Chat user: ", user_name, 
		" users in range: ", users_in_range_as_string,
		" count: ", users_in_range.size())
