/*
 * InstagramDMCleaner for AutoHotkey v1.1
 *
 * Script repository: https://github.com/a7md0/InstagramDMCleaner
 *
 * AutoHotkey software: https://www.autohotkey.com/
 * AutoHotkey repository: https://github.com/Lexikos/AutoHotkey_L
 *
 * Automated script to delete Instagram direct messages in bulk, delete in bulk feature is not available on Instagram.
 * The script will drag the first message using the mouse to the left and click the delete option and will confirm the delete action.
 * Exact steps will be applied for the second message. An infinite loop is applied.
 * To start/pause/resume the script press `b` and press `n` to terminate the script.
 *
 * MIT License
 * Copyright (c) 2019 a7md0
*/

#InstallMouseHook
#MaxThreadsPerHotkey 2
#IfWinActive Instagram

SetWinDelay, 0
delayMS := 450 ; 450ms delay between each iteration. (Notice that 50 + 500 + 450 is the actual delay between each request)
MsgBox, Script started!`nPress b to toggle on and n to exit app!

n::ExitApp
b::
WinMove, Instagram, , -8, -8, 800, 576
Toggle := !Toggle
loop
{
    If not Toggle
		break
	
	IfWinActive, Instagram
	{
		; If you have a conversation that cannot be deleted increase it by 60, for example, if the first conversation cannot be deleted put 240 instead of 180.
		Click 120, 180 ; We select conversation
		Click 760, 120 ; We click on the information of the conversation
		Click 595, 350 ; We click on delete
		Click ; We confirm the deletion
	}
	sleep %delayMS%
}
return  
