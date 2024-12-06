# Like Current Song On Spotify
## Script for liking song
### Script structure
- `script.py` is main script doing all the work
- `requirements.txt` is requirements to run this main python script
- `start.bat` is script starting python script
- `start.vbs` is vbs script for making start.bat without command line window (and window focus issues because of it)
### My Setup
For Razer BlackWidow V3 i added on HyperShift+L -> Launch Program -> start.vbs.

## Files

### `start.vbs`
```VB
Set WshShell = CreateObject("WScript.Shell")
Dim oFSO : Set oFSO = CreateObject("Scripting.FileSystemObject")
Dim sScriptDir : sScriptDir = oFSO.GetParentFolderName(WScript.ScriptFullName)
WshShell.Run chr(34) & sScriptDir & "/start.bat" & Chr(34), 0
Set WshShell = Nothing
```

### `start.bat`
```Console
python .\main.py
```

### `requirements.txt`
```Text
spotipy>=2.19.0
```
### `main.py`

```Python
import spotipy
from spotipy import SpotifyOAuth, SpotifyException

username = ''
client_id = ''
client_secret = ''
redirect_uri = 'http://localhost:7777/callback'
scope = 'user-library-modify,user-read-currently-playing'

auth_manager = SpotifyOAuth(scope=scope, client_id=client_id, client_secret=client_secret, redirect_uri=redirect_uri)
sc = spotipy.Spotify(oauth_manager=auth_manager)
playing = sc.currently_playing()
if "item" not in playing or "id" not in playing["item"]:
    print("Error: Currently not playing anything")
    exit(255)
playing_id = playing["item"]["id"]
try:
    r = sc.current_user_saved_tracks_add([playing_id])
    print(r)
except SpotifyException as e:
    print("Error: Song not found or something else")
    print(e)
```
#### Data needed for this script
- `username` - Your Spotify username
- `client_id` - Your Spotify client id from [Your app in Developer Portal](https://developer.spotify.com/dashboard)
- `client_secret` - Your Spotify client secret from [Your app in Developer Portal](https://developer.spotify.com/dashboard)