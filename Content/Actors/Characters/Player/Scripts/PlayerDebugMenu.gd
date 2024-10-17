extends Node

func _process(_delta):
	if not ImGui.Begin("Player Debug Menu"):
		return
		
	ImGui.Text("FPS: %d" % Engine.get_frames_per_second())
		
	if ImGui.Button("Send test message to nearest user"):
		%ChatUser.send_message_to_nearest_user("Test Message")
		
	if ImGui.Button("Send test message to all users in range"):
		%ChatUser.send_message_to_all_users_in_range("Test Message")
	
	ImGui.End()