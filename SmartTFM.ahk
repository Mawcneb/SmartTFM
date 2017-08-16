; SmartTFM
; Credits: Mawcn
; Written in: AutoHotkey 2.0-a081-cad307c

; This script is shared on MIT license
; what means that you can redistribute, edit or whatever else
; just don't forget about put credits and what license is used here

; Hide icon in taskbar
#NoTrayIcon
; Prevent from displaying message while application is running second time at the same time
#SingleInstance


; If Transformice window doesn't exists
If(!WinExist("Transformice"))
{
	; Display message about error
	MsgBox("Error #1 - Transformice hasn't been detected!", "SmartTFM", "Icon!")
	; Force quit application
	ExitApp()
}

; #IfWinActive makes hotkeys working only for specified applications
; and only when that window is on the top
#IfWinActive ahk_exe Transformice.exe
; Shift + F
+f::
	; There are more effective ways to make it work
	; It uses PixelSearch function
	; to determine location of specified colors
	
	; Here color BF2323 is just inner color of the heart
	; in friend list button
	
	; I can replace it with ImageSearch
	; which finds specified image (here friend list button)
	; but as long as it doesn't collide with for example
	; ground colors or outfits
	; which contains same color as used here
	; I won't change it
	PixelSearch(DEF_FRIENDLISTX, DEF_FRIENDLISTY, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xBF2323, 0, "Fast")
	; If pixel was found
	If(ErrorLevel = 0)
	{
		; Click on it
		Click(DEF_FRIENDLISTX, DEF_FRIENDLISTY)
	}
	; If not
	Else
	{
		; Display message about error
		MsgBox("Error #2 - Friend list button hasn't been detected!", "SmartTFM", "Icon!")
	}
; It finishes using function
Return

; Tribe window

; Function below and later are same
; as in previous part of code
; there are just changed few things
+t::
	PixelSearch(DEF_TRIBEX, DEF_TRIBEY, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xCDA11D, 0, "Fast")
	If(ErrorLevel = 0)
	{
		Click(DEF_TRIBEX, DEF_TRIBEY)
	}
	Else
	{
		MsgBox("Error #3 - Tribe button hasn't been detected!", "SmartTFM", "Icon!")
	}
Return

; Cafe
+c::
	PixelSearch(DEF_CAFEX, DEF_CAFEY, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xD9D3C9, 0, "Fast")
	If(ErrorLevel = 0)
	{
		Click(DEF_CAFEX, DEF_CAFEY)
	}
	Else
	{
		MsgBox("Error #3 - Cafe button hasn't been detected!", "SmartTFM", "Icon!")
	}
Return

; Room list
+l::
	PixelSearch(DEF_ROOMLISTX, DEF_ROOMLISTY, 0, 0, A_ScreenWidth, A_ScreenHeight, 0x7D3400, 0, "Fast")
	If(ErrorLevel = 0)
	{
		Click(DEF_ROOMLISTX, DEF_ROOMLISTY)
	}
	Else
	{
		MsgBox("Error #4 - Room list button hasn't been detected!", "SmartTFM", "Icon!")
	}
Return

; Shop
+s::
	PixelSearch(DEF_ROOMLISTX, DEF_ROOMLISTY, 0, 0, A_ScreenWidth, A_ScreenHeight, 0x7B2606, 0, "Fast")
	If(ErrorLevel = 0)
	{
		Click(DEF_ROOMLISTX, DEF_ROOMLISTY)
	}
	Else
	{
		MsgBox("Error #5 - Shop button hasn't been detected!", "SmartTFM", "Icon!")
	}
Return

; Map editor

; Instead of Shift
; there is Ctrl used here
^e::
	; Send function sends specified keys to application
	; {Enter} is needed
	; because it's used to write something on chat
	Send("{Enter}/editeur{Enter}")
Return

; Forum
^f::
	; It runs specified website
	Run("http://atelier801.com")
Return

; Lua
^l::
	Send("{Enter}/lua{Enter}")
Return
	
; Mort
^m::
	Send("{Enter}/mort{Enter}")
Return

; Profile
^p::
	Send("{Enter}/profile{Enter}")
Return
; Finish using of #IfWinActive
#IfWinActive

; Close app
^Escape::
	; Display message with question
	; if user really want to exit app
	DEF_RESULT := MsgBox("Do you want exit SmartTFM app?", "SmartTFM", "Iconi Y/N")
	; If user clicked Yes button
	; which means confirmation of closing app
	If(DEF_RESULT = "Yes")
	{
		; Force quit app
		ExitApp()
	}
	; But if user clicked No button
	Else If(DEF_RESULT := "No")
	{
		; Here Return means
		; do nothing
		; just continue work of script
		Return
	}
Return
