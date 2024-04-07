CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
IniFile := A_ScriptDir . "\twisted_rolling_settings.ini"

if not (FileExist(IniFile)) { ; creates the ini file if it does not exist
FileAppend,
(
[Main]
MinVTP=0,
), % IniFile, utf-16 ; save your ini file asUTF-16LE
}

MsgBox, ,, Twisted Roller, Use Ctrl + K for options. Press Ctrl + J to run script. Press ESC to close at any point.

IfMsgBox Ok
	return
IfMsgBox Cancel
	ExitApp



^k::


InputBox, minimumVTP, Enter minimum VTP, If empty there will be no minimum. Do not set above 5., 640, 4
IniWrite % minimumVTP, % IniFile, Main, MinVTP ; writes the new value to the ini file

pause, On

^j::
IniRead, minimumVTP, % IniFile, Main, MinVTP
MsgBox, minimum vtp is currently set to %minimumVTP%.

Pause, Off
theLoop:
MouseMove, 176, 1361
sleep, 500
MouseClick, left

sleep, 8000,
Process, Exist, roblox.exe
If ErrorLevel = 0
{
	MouseClick, Left
}

Loop {
	pixelGetColor, liteColor, 1490, 1265, RGB
	if (liteColor = 0xFF557F)
	{
		Break
	}
} 
	
MouseMove, 1480, 1270



sleep, 50

pixelGetColor, liteColor, 1490, 1265, RGB

if (liteColor = 0xB33B59)
{
	sleep, 500
	MouseClick, left
	MouseMove, 1412, 298
	MouseClick, left
}
else if (liteColor = 0x77B359)
{
	sleep, 100
	MouseMove, 1412, 298
	MouseClick, left
}
else
{
	MsgBox, There was a problem checking for Lite. Please make sure your screen is 2560x1440, and your windows are correct.
	ExitApp
}

Loop {
	pixelGetColor, thermos, 1906, 88, RGB
	if (thermos = 0x323232)
	{
		Break
	}
} 

sleep 100

Loop {
	pixelGetColor, thermos, 1918, 101, RGB
	if (thermos = 0xFFFFFF)
	{
		Break
	}
} 

sleep, 500

MouseMove, 1906, 88
sleep, 100
MouseClick, left
sleep, 400
MouseMove, 1857, 96
MouseClick, left
sleep, 1200
pixelGetColor, difficulty, 1748, 182, RGB

if (difficulty = 0xFF7FFF)
{
	Debut:
		Loop, 5
		{
			if (minimumVTP > 1)
			{
			if (MinimumVTP = 1)
					Goto, Check1
			if (MinimumVTP = 2)
					Goto, Check2
			if (MinimumVTP = 3)
					Goto, Check3
			if (MinimumVTP = 4)
					Goto, Check4
			if (MinimumVTP = 5)
					Goto, Check5
				
			Check1:
			CoordMode Pixel
			ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, %A_ScriptDir%\reference_images\1_vtp.png
			if (ErrorLevel = 2)
			{
					MsgBox, Could not detect VTP.
			}
			else if (ErrorLevel = 1)
			{
					Goto, Check2
			}
			else
			{
				Goto, RequirementsMet
			}
			}
		
			; --------------------------------------------------------------
		
			Check2:
			CoordMode Pixel
			ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, %A_ScriptDir%\reference_images\2_vtp.png
			if (ErrorLevel = 2)
			{
				MsgBox, Could not detect VTP.
			}
			else if (ErrorLevel = 1)
			{
				Goto, Check3
			}
			else
			{
				Goto, RequirementsMet
			}
		
			; --------------------------------------------------------------
		
			Check3:
			CoordMode Pixel
			ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, %A_ScriptDir%\reference_images\3_vtp.png
			if (ErrorLevel = 2)
			{
				MsgBox, Could not detect VTP.
			}
			else if (ErrorLevel = 1)
			{
				Goto, Check4
			}
			else
			{
				Goto, RequirementsMet
			}
			
			; --------------------------------------------------------------
			
			Check4:
			CoordMode Pixel
			ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, %A_ScriptDir%\reference_images\4_vtp.png
			if (ErrorLevel = 2)
			{
				MsgBox, Could not detect VTP.
			}
			else if (ErrorLevel = 1)
			{
				Goto, Check5
			}
			else
			{
				Goto, RequirementsMet
			}
		
			; ---------------------------------------------------------------
		
			Check5:
			CoordMode Pixel
			ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, %A_ScriptDir%\reference_images\5_vtp.png
			if (ErrorLevel = 2)
			{
				MsgBox, Could not detect VTP.
			}
			else if (ErrorLevel = 1)
			{
				Goto, Check6
			}
			else
			{
				Goto, RequirementsMet
			}
		
			; ---------------------------------------------------------------
		
			Check6:
			CoordMode Pixel
			ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, %A_ScriptDir%\reference_images\6_vtp.png
			if (ErrorLevel = 2)
			{
				MsgBox, Could not detect VTP.
			}
			else if (ErrorLevel = 1)
			{
				Goto, theLoop
			}
			else
			{
				Goto, RequirementsMet
			}
		
			; ---------------------------------------------------------------
			
			; Add additional checks or actions here as needed
		
		}
		
		; ---------------------------------------------------------------
		
		If (minimumVTP = 0)
		{
			Goto, RequirementsMet
		}
	
		
		RequirementsMet:
		MsgBox, 4, , Set requirements for server were found. Keep?
		IfMsgBox, No 
			Goto, theLoop
		Else
			ExitApp
		sleep, 20

}
else
{
	Goto, theLoop
}

Esc::ExitApp