extends RichTextLabel


func add_entry(author : String, entry_text : String):
	var entry = author + ": " + entry_text + "\n"
	add_text(entry)
	scroll_to_line(get_line_count())
