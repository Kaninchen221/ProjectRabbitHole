extends Node

func _process(_delta):
	if not ImGui.Begin("Player Debug Menu"):
		ImGui.End()
		return
		
	ImGui.Text("FPS: %d" % Engine.get_frames_per_second())
		
	chat_user_debug_menu()
	
	ImGui.End()

func chat_user_debug_menu():
	if ImGui.CollapsingHeader("Chat User"):
		horizontal_space()
		if ImGui.CollapsingHeader("Send test message to nearest user"):
			horizontal_space()
			if ImGui.Button("Hi"):
				%ChatUser.send_message_to_nearest_user("Hi")
			ImGui.SameLine()
			if ImGui.Button("Bye"):
				%ChatUser.send_message_to_nearest_user("Bye")
		
		if ImGui.CollapsingHeader("Send test message to all users in range"):
			if ImGui.Button("Test Message"):
				%ChatUser.send_message_to_all_users_in_range("Test Message")

func horizontal_space():
	ImGui.Text("\t")
	ImGui.SameLine()
	
