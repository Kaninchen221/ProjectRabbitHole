extends Node

func _process(delta):
	if not ImGui.Begin("Player Debug Menu"):
		return
		
	if ImGui.Button("Send test message to nearest user"):
		%ChatUser.send_message_to_nearest_user("Test Message")
		
	if ImGui.Button("Send test message to all users in range"):
		%ChatUser.send_message_to_all_users_in_range("Test Message")
	
	ImGui.End()
