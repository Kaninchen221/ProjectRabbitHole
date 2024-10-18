extends LineEdit

signal on_sent_text(text : String)

func _input(event):
	if event.is_action_pressed("Player_Confirm"):
		send_text()

func send_text():
	if text.is_empty():
		return
		
	#print("Terminal send text: ", text)
	#%TerminalContext.add_entry("Player", text)
	on_sent_text.emit(text)
	text = ""
