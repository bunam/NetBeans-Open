NetBeans-Open
=============

AppleScript to open files in NetBeans from the Mac OS X Finder (arff!)

So bad that it's not included :
https://netbeans.org/bugzilla/show_bug.cgi?id=138943

##Install

You have to export as an Application with this AppleScript Editor

Put the Application in you Dock or the Finder Toolbar (Command  + drop on Mac OS X 10.9+)

So the content of the script

```
-- This AppleScript created by John Kramlich of http://www.johnkramlich.com
-- Modify it in anyway you see fit.
-- moded by bunam https://github.com/bunam/NetBeans-Open
return -- not needed, but shows that the script stops here when "run"

on open of finderObjects -- "open" handler triggered by drag'n'drop launches
	
	set netBeansAppName to do shell script "ls -1 /Applications/NetBeans/ | grep -e '^NetBeans' | sort | tail -n 1"
	
	set netBeansAppFullPath to "/Applications/NetBeans/" & netBeansAppName & "/Contents/MacOS/netbeans"
	
	set netBeansAppFullPathQuoted to quoted form of netBeansAppFullPath
	
	repeat with i in (finderObjects) -- in case multiple objects dropped on applet
		
		set mypath to POSIX path of i
		
		do shell script netBeansAppFullPathQuoted & " --open " & quoted form of mypath
		
	end repeat
	
	tell application netBeansAppName
		activate
	end tell
	
end open
```

## Additional resources

An icon is provided :

- droplet.icns

