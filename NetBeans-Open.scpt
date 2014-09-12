-- This AppleScript created by John Kramlich of http://www.johnkramlich.com
-- Modify it in anyway you see fit.
-- moded by bunam https://github.com/bunam/NetBeans-Open
return -- not needed, but shows that the script stops here when "run"

on open of finderObjects -- "open" handler triggered by drag'n'drop launches
	
	set netBeansAppNameLastRev to do shell script "ls -1 /Applications/NetBeans/ | grep -e '^NetBeans' | sed 's/.app//g' | sort | tail -n 1"
	
	set netBeansAppNameLastRev to netBeansAppNameLastRev & ".app"
	
	set netBeansAppFullPath to "/Applications/NetBeans/" & netBeansAppNameLastRev & "/Contents/MacOS/netbeans"
	
	set netBeansAppFullPathQuoted to quoted form of netBeansAppFullPath
	
	repeat with i in (finderObjects) -- in case multiple objects dropped on applet
		
		set mypath to POSIX path of i
		
		do shell script netBeansAppFullPathQuoted & " --open " & quoted form of mypath
		
	end repeat
	
	tell application netBeansAppNameLastRev
		activate
	end tell
	
end open
