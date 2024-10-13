extends Node

var terminal_text : String
var input_text_buffer = ['']

func _process(delta):
	if ImGui.Begin("Default"):
		log_window()
		ImGui.Separator()
		input_bar()
		ImGui.End()

var items = []
func log_window():
	var footer_height_to_reserve = 200
	if ImGui.BeginChild("ScrollRegion##", Vector2(0, footer_height_to_reserve), false, 0):
		# Display colored command output.
		var timestamp_width = ImGui.CalcTextSize("00:00:00:0000").x  # Timestamp width
		ImGui.Text(terminal_text)
		ImGui.EndChild()

func input_bar():
	var reclaim_focus = false
	var input_text_flags = (ImGui.InputTextFlags_CallbackHistory | 
								ImGui.InputTextFlags_CallbackCharFilter | 
								ImGui.InputTextFlags_CallbackCompletion |
								ImGui.InputTextFlags_EnterReturnsTrue | 
								ImGui.InputTextFlags_CallbackAlways |
								ImGui.InputTextFlags_EnterReturnsTrue)
	if ImGui.InputText("", input_text_buffer, input_text_flags):
		reclaim_focus = true
		push_buffer()
		clear_buffer()
		
	#ImGui.PopItemWidth(); # Causing crash
	
	# Restore focus
	ImGui.SetItemDefaultFocus()
	if reclaim_focus:
		ImGui.SetKeyboardFocusHereEx(-1)

func push_buffer():
	terminal_text += "".join(input_text_buffer)

func clear_buffer():
	input_text_buffer = ['']
