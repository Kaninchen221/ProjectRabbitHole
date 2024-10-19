extends Node2D

var conversation_partner

func _on_chat_user_received_message(sender: Variant, received_message: String) -> void:
	var message = received_message.to_lower()
	
	if message == "hi" and not conversation_partner:
		conversation_partner = sender
		sender.receive_message(%ChatUser, "Hi")
		return
		
	if message == "bye" and conversation_partner:
		conversation_partner = null
		%ChatUser.send_message_to_nearest_user("Bye")
		return


func _on_chat_user_exited(chat_user: Variant) -> void:
	if chat_user == conversation_partner:
		var conversation_partner_temp = conversation_partner
		conversation_partner = null
		conversation_partner_temp.receive_message(%ChatUser, "Bye")
