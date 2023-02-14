from pytube import YouTube
import tkinter as tk
from tkinter import filedialog

def download():
    # Get the URL of the video from the user
    url = url_entry.get()

    # Create a YouTube object from the URL
    video = YouTube(url)

    # Get the highest resolution stream
    stream = video.streams.get_highest_resolution()

    # Ask the user to select a download location
    save_path = filedialog.askdirectory()

    # Download the video to the selected location
    print("Downloading...")
    stream.download(output_path=save_path)
    print("Download complete!")

# Create a GUI window using tkinter
root = tk.Tk()
root.title("YouTube Downloader")

# Create a label for the URL entry field
url_label = tk.Label(root, text="Enter the URL of the YouTube video you want to download:")
url_label.pack()

# Create an entry field for the URL
url_entry = tk.Entry(root)
url_entry.pack()

# Create a button to initiate the download
download_button = tk.Button(root, text="Download", command=download)
download_button.pack()

# Run the GUI loop
root.mainloop()

