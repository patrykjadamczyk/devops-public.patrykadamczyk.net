import os
import pyttsx3

cwd = os.getcwd()
file_name = os.path.join(cwd, "text.txt")

with open(file_name, "r", encoding='utf-8') as file:
    speaker = pyttsx3.init()
    text = file.read().replace('\n', ' ')

    speaker.save_to_file(text, "text.mp3")
    speaker.runAndWait()
    speaker.stop()
