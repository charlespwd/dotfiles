tell application "OBS" to activate
tell application "System Events"
	tell process "OBS"
		set frontmost to true
		key down 63 -- fn
		key code 96 -- f5
		set visible to false
	end tell
end tell
tell application "Google Chrome" to activate
