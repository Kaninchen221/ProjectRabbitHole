extends RichTextLabel


func add_entry(author : String, text : String):
	var entry = author + ": " + text + "\n"
	add_text(entry)
	scroll_to_line(get_line_count())
