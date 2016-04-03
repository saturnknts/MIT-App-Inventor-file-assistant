#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Android Icon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
#include <File.au3>
#include <Process.au3>
#include <GuiListView.au3>
#include <GuiListBox.au3>
#include <editconstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <7Zip.au3>
#include <TabConstants.au3>
#include <GuiTab.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <Marquee.au3>
#include <Skin.au3>

Dim $sFileOpenDialog, $filechosen, $filechosen2, $temp, $sAutoItDir, $getscreen = 0, $getpath, $iBlue = 1, $zipfile = 0, $zipfile2 = 0
Dim $AI2green = 0x8FC202, $AI2textmaroon = 0xB32D5E, $AI2listblue = 0x58B5DC, $AI2controlgold = 0xCFAC4B, $AI2variableorange = 0xDB743A, $AI2procedurepurple = 0x8F6997
Dim $Pic[5]
Dim $guiw = 720, $guih = 520
Global $aTabColours, $Pic[5], $Button[5]
Global $Selectfile, $PickLabel, $List1, $copyname, $CopyButton1, $Close
;Global $Selectfile2, $PickLabel2, $List2, $copyname2, $ReNameButton

;Dim $Aboutmitlink, $Createlink, $scottlink, $hosseinlink, $Emaillink, $Close2

;284


#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Ai2 File Assistant", $guiw, $guih)
GUISetBkColor(0x8FC202)
GUISetIcon(@ScriptDir & "\Android Icon.ico")

$Button[0] = _Skin_AddButton($guiw * 0.01953125, $guih * 0.078125, $guiw * .15, $guih * 0.0859375, 'purple_button_up.png', 'purple_button_over.png', 'purple_button_down.png', 'disable.png', 'alpha.png', 1)
$Button[1] = _Skin_AddButton($guiw * 0.01953125, ($guih * 0.078125) + 58, $guiw * 0.240234375, $guih * 0.0859375, 'maroon_button_up.png', 'maroon_button_over.png', 'maroon_button_down.png', 'disable.png', 'alpha.png', 1)
$Button[2] = _Skin_AddButton($guiw * 0.01953125, ($guih * 0.078125) + 108, $guiw * 0.240234375, $guih * 0.0859375, 'light_blue_button_up.png', 'light_blue_button_over.png', 'light_blue_button_down.png', 'disable.png', 'alpha.png', 1)
$Button[3] = _Skin_AddButton($guiw * 0.01953125, ($guih * 0.078125) + 158, $guiw * 0.240234375, $guih * 0.0859375, 'orange_button_up.png', 'orange_button_over.png', 'orange_button_down.png', 'disable.png', 'alpha.png', 1)
GUISetState(@SW_SHOW, $Form1)


$child = GUICreate("", $guiw * 0.720703125, $guih * 0.9479166666666667, $guiw * 0.259765625, $guih * 0.0260416666666667, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $Form1);BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD)
GUISetBkColor(0x8FC202)
;$tabcolor = GUICtrlCreatePic(@ScriptDir & "\middlepurple.gif", 0, 0, $guiw*0.720703125, $guih*0.9479166666666667)
;GuiCtrlSetState(-1, $GUI_DISABLE)


;$tab = GUICtrlCreateTab(-1,-1, $guiw/2, $guih/2)
$tab = GUICtrlCreateTab(100, 100, $guiw / 10, $guih / 10)
GUICtrlSetState(-1, $GUI_DISABLE)

$Tabcopy = GUICtrlCreateTabItem("Copy")

GUICtrlCreatePic(@ScriptDir & "\middlepurple.gif", 0, 0, $guiw * 0.720703125, $guih * 0.9479166666666667)
GUICtrlSetState(-1, $GUI_DISABLE)

;$Button[4] = _Skin_AddButton((($guiw*0.720703125)/2) - 165 , 25, 330, 35, 'purple_button_up.png', 'purple_button_over.png', 'purple_button_down.png', 'disable.png', 'alpha.png', 1)
$Selectfile = GUICtrlCreateButton("Select your Project File", (($guiw * 0.720703125) / 2) - 165, 50, 330, 35, $BS_DEFPUSHBUTTON);, $WS_EX_TRANSPARENT)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")


$PickLabel = GUICtrlCreateLabel("", (($guiw * 0.720703125) / 2) - 165, 100, 330, 35, BitOR($WS_BORDER,$BS_VCENTER))
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, $COLOR_RED)

$Label1 = GUICtrlCreateLabel("Highlight the Screen Name you want to make a Copy of", (($guiw * 0.720703125) / 2) - 165, 160, 330, 20, $SS_CENTER)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, 0x7C5385)

$List1 = GUICtrlCreateList("", (($guiw * 0.720703125) / 2) - 165, 180, 330, 80)
GUICtrlSetData(-1, "")
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, $COLOR_RED)

$Label12 = GUICtrlCreateLabel("What would you like the new Screen to be called?", (($guiw * 0.720703125) / 2) - 165, 280, 330, 20, $SS_CENTER)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, 0x7C5385)

$copyname = GUICtrlCreateInput("Enter the New copies name here", (($guiw * 0.720703125) / 2) - 165, 300, 330, 35, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $WS_BORDER))
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, $COLOR_RED)
GUICtrlSetTip(-1, "Must start with a letter and have no spaces in the name")

$CopyButton1 = GUICtrlCreateButton("Copy", (($guiw * 0.720703125) / 2) - 165, 350, 330, 50, $BS_DEFPUSHBUTTON);, $WS_EX_TRANSPARENT)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Close = GUICtrlCreateButton("Close", (($guiw * 0.720703125) / 2) - 76, 425, 153, 33)

;For $i = 0 To 4
;	$Pic[$i] = GUICtrlCreatePic(@ScriptDir & '\img_black.bmp', 10, 24 + 50 * $i, 162, 49)
;	GUICtrlCreateLabel('Tabsheet' & $i, 21, 40 + 50 * $i, 140, 18, $SS_CENTER)
;	GUICtrlSetFont(-1, 11, 400, 0, 'Tahoma')
;	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
;	GUICtrlSetcolor(-1, 0xFFFFFF)
;

$tabrename = GUICtrlCreateTabItem("Rename")
GUICtrlCreatePic(@ScriptDir & "\middlemaroon.gif", 0, 0, $guiw * 0.720703125, $guih * 0.9479166666666667)
GUICtrlSetState(-1, $GUI_DISABLE)

$Selectfile2 = GUICtrlCreateButton("Select your Project File", (($guiw * 0.720703125) / 2) - 165, 50, 330, 35, $BS_DEFPUSHBUTTON)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")

$PickLabel2 = GUICtrlCreateLabel("", (($guiw * 0.720703125) / 2) - 165, 100, 330, 35, $WS_BORDER)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, $COLOR_RED)

$Label2 = GUICtrlCreateLabel("Highlight the Screen Name you want to ReName", (($guiw * 0.720703125) / 2) - 165, 160, 330, 20, $SS_CENTER)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")

$List2 = GUICtrlCreateList("", (($guiw * 0.720703125) / 2) - 165, 180, 330, 80)
GUICtrlSetData(-1, "")
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, $COLOR_RED)

$Label22 = GUICtrlCreateLabel("What would you like to ReName it to?", (($guiw * 0.720703125) / 2) - 165, 280, 330, 20, $SS_CENTER)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
$copyname2 = GUICtrlCreateInput("Enter the New name here", (($guiw * 0.720703125) / 2) - 165, 300, 330, 35, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $WS_BORDER))
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, $COLOR_RED)
GUICtrlSetTip(-1, "Must start with a letter and have no spaces in the name")

$ReNameButton = GUICtrlCreateButton("ReName", (($guiw * 0.720703125) / 2) - 165, 350, 330, 50, $BS_DEFPUSHBUTTON)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Close2 = GUICtrlCreateButton("Close", (($guiw * 0.720703125) / 2) - 76, 425, 153, 33)


$tabreorder = GUICtrlCreateTabItem("Reorder")
GUICtrlCreatePic(@ScriptDir & "\middlelightblue.gif", 0, 0, $guiw * 0.720703125, $guih * 0.9479166666666667)
GUICtrlSetState(-1, $GUI_DISABLE)


$tababout = GUICtrlCreateTabItem("About")

GUICtrlCreatePic(@ScriptDir & "\middleorange.gif", 0, 0, $guiw * 0.720703125, $guih * 0.9479166666666667)
GUICtrlSetState(-1, $GUI_DISABLE)

$Mitapplabel = GUICtrlCreateEdit("Created to assist programmers using" & @CRLF & "MIT App Inventor 2" & @CRLF & "to copy and rename screens easily", (($guiw * 0.720703125) / 2) - 200, 50, 400, 80, $SS_CENTER);, BitOR($SS_CENTER,$SS_CENTERIMAGE))
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, 0x3f71b5)
$Aboutmitlink = GUICtrlCreateLabel("About MIT App Inventor 2", 48, 176, 350, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Createlink = GUICtrlCreateLabel("Link to Create Android Apps with MIT App Inventor 2", 48, 206, 350, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Basedlabel = GUICtrlCreateLabel("Based upon this Idea from Scott Ferguson", 48, 235, 350, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 0, "MS Sans Serif")
$scottlink = GUICtrlCreateLabel("Scott's Example", 48, 265, 350, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$alsolabel = GUICtrlCreateLabel("Also to M. Hossein Amerkashi for the great video", 48, 295, 350, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 0, "MS Sans Serif")
$hosseinlink = GUICtrlCreateLabel("M. Hossein Amerkashi's Example", 48, 325, 350, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$buglabel = GUICtrlCreateLabel("Questions or bug reports feel free to email me", 48, 354, 350, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 0, "MS Sans Serif")
$Emaillink = GUICtrlCreateLabel("Tim Houser", 48, 384, 100, 20, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 11, 800, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlCreateTabItem("")

_GUICtrlTab_SetCurFocus($tab, 0)
;GUISetState(@SW_SHOW)
GUISetState()

#EndRegion ### END Koda GUI section ###



While 1
	_Skin_Helper($Form1)
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $Selectfile
			Directorycleanup()
			Pickfile()
			GUICtrlSetData($PickLabel, $filechosen)
			$zipfile = StringTrimRight($filechosen, 4) & ".zip"
			FileMove($filechosen, $zipfile, 1);rename the file to zip
			_7ZIPExtractex($Form1, $zipfile, @ScriptDir); & "\Temp")
			$bkylist = _FileListToArrayRec(@ScriptDir, "*.bky", $FLTAR_FILES, $FLTAR_RECUR, $FLTAR_SORT)
			FillList()
			;MsgBox(0, "", $getscreen)

		Case $Selectfile2
			Directorycleanup()
			Pickfile2()
			GUICtrlSetData($PickLabel2, $filechosen2)
			$zipfile2 = StringTrimRight($filechosen2, 4) & ".zip"
			FileMove($filechosen2, $zipfile2, 1);rename the file to zip
			_7ZIPExtractex($Form1, $zipfile2, @ScriptDir); & "\Temp")
			$bkylist2 = _FileListToArrayRec(@ScriptDir, "*.bky", $FLTAR_FILES, $FLTAR_RECUR, $FLTAR_SORT)
			FillList2()
			;MsgBox(0, "", $getscreen)

		Case $List1
			$getscreen = GUICtrlRead($List1)
			$readname = GUICtrlRead($copyname)
			If $readname = "Enter the New copies name here" Then
				GUICtrlSetData($CopyButton1, "Press to copy the screen " & @CR & "'" & $getscreen & "'" & " to ")
			Else
				GUICtrlSetData($CopyButton1, "Press to copy the screen " & @CR & "'" & $getscreen & "'" & " to " & "'" & $readname & "'")
			EndIf
			GUICtrlSetBkColor($List1, $COLOR_LIME)

		Case $List2
			$getscreen = GUICtrlRead($List2)
			$readname = GUICtrlRead($copyname2)
			If $readname = "Enter the New name here" Then
				GUICtrlSetData($ReNameButton, "Press to ReName the screen " & @CR & "'" & $getscreen & "'" & " to ")
			Else
				GUICtrlSetData($ReNameButton, "Press to ReName the screen " & @CR & "'" & $getscreen & "'" & " to " & "'" & $readname & "'")
			EndIf
			GUICtrlSetBkColor($List2, $COLOR_LIME)

		Case $copyname
			$readname = GUICtrlRead($copyname)
			$checkfornumber = StringLeft($readname, 1)
			If StringIsDigit($checkfornumber) = 1 Then
				MsgBox(0, "", "Name may not start with a number")
				$checkfornumber = Null
			ElseIf StringIsAlNum($readname) = 1 Then
				GUICtrlSetData($CopyButton1, "Press to copy the screen " & @CR & "'" & $getscreen & "'" & " to " & "'" & $readname & "'")
			ElseIf StringIsAlNum($readname) = 0 Then
				MsgBox(0, "", "Name may not include a space and may only contain alphanumeric characters")
			EndIf
			GUICtrlSetBkColor($copyname, $COLOR_LIME)

		Case $copyname2
			$readname = GUICtrlRead($copyname2)
			$checkfornumber = StringLeft($readname, 1)
			If StringIsDigit($checkfornumber) = 1 Then
				MsgBox(0, "", "Name may not start with a number")
				$checkfornumber = Null
			ElseIf StringIsAlNum($readname) = 1 Then
				GUICtrlSetData($ReNameButton, "Press to ReName the screen " & @CR & "'" & $getscreen & "'" & " to " & "'" & $readname & "'")
			ElseIf StringIsAlNum($readname) = 0 Then
				MsgBox(0, "", "Name may not include a space and may only contain alphanumeric characters")
			EndIf
			GUICtrlSetBkColor($copyname2, $COLOR_LIME)

		Case $CopyButton1
			$readname = GUICtrlRead($copyname)
			$checklabel = GUICtrlRead($PickLabel)
			$getscreen = GUICtrlRead($List1)
			If $checklabel = "" Then ;GUICtrlRead($copyname)
				MsgBox(0, "", "Please pick a project file first")
			ElseIf $getscreen = "" Then
				MsgBox(0, "", "Select Screen to Copy first!")
			ElseIf $readname = "Enter the New copies name here" Then ;GUICtrlRead($copyname)
				MsgBox(0, "", "Please pick a name for your new copy")

			Else

				FileCopy($getpath & $getscreen & ".bky", $getpath & $readname & ".tmp");copy to tmp file
				FileMove($getpath & $readname & ".tmp", $getpath & $readname & ".bky");rename
				FileCopy($getpath & $getscreen & ".scm", $getpath & $readname & ".tmp");copy to tmp file
				FileMove($getpath & $readname & ".tmp", $getpath & $readname & ".scm");rename
				FileCopy($getpath & $getscreen & ".yail", $getpath & $readname & ".tmp");copy to tmp file
				FileMove($getpath & $readname & ".tmp", $getpath & $readname & ".yail");rename

				$bkyupdate = _ReplaceStringInFile($getpath & "\" & $readname & ".bky", $getscreen, $readname, 1)
				$scmupdate = _ReplaceStringInFile($getpath & "\" & $readname & ".scm", $getscreen, $readname, 1)
				$yailupdate = _ReplaceStringInFile($getpath & "\" & $readname & ".yail", $getscreen, $readname, 1)
				FileSetAttrib($getpath, "-A", 1)
				_7ZIPupdate($Form1, $zipfile, $getpath & $readname & ".bky", 0, 5, 1)
				_7ZIPupdate($Form1, $zipfile, $getpath & $readname & ".scm", 0, 5, 1)
				_7ZIPupdate($Form1, $zipfile, $getpath & $readname & ".yail", 0, 5, 1)

				FillList()

			EndIf

		Case $ReNameButton
			$readname = GUICtrlRead($copyname2)
			$checklabel = GUICtrlRead($PickLabel2)
			$getscreen = GUICtrlRead($List2)
			If $checklabel = "" Then ;GUICtrlRead($copyname)
				MsgBox(0, "", "Please pick a project file first")
			ElseIf $getscreen = "" Then
				MsgBox(0, "", "Select Screen to ReName first!")
			ElseIf $readname = "Enter the New name here" Then ;GUICtrlRead($copyname)
				MsgBox(0, "", "Please Type a name first")

			Else

				;FileCopy($getpath & $getscreen & ".bky", $getpath & $readname & ".tmp");copy to tmp file
				FileMove($getpath & $getscreen & ".bky", $getpath & $readname & ".bky");rename
				;FileCopy($getpath & $getscreen & ".scm", $getpath & $readname & ".tmp");copy to tmp file
				FileMove($getpath & $getscreen & ".scm", $getpath & $readname & ".scm");rename
				;FileCopy($getpath & $getscreen & ".yail", $getpath & $readname & ".tmp");copy to tmp file
				FileMove($getpath & $getscreen & ".yail", $getpath & $readname & ".yail");rename

				$bkyupdate = _ReplaceStringInFile($getpath & "\" & $readname & ".bky", $getscreen, $readname, 1)
				$scmupdate = _ReplaceStringInFile($getpath & "\" & $readname & ".scm", $getscreen, $readname, 1)
				$yailupdate = _ReplaceStringInFile($getpath & "\" & $readname & ".yail", $getscreen, $readname, 1)
				FileSetAttrib($getpath, "-A", 1)

				_7ZIPupdate($Form1, $zipfile2, $getpath & $readname & ".bky", 0, 5, 1)
				_7ZIPupdate($Form1, $zipfile2, $getpath & $readname & ".scm", 0, 5, 1)
				_7ZIPupdate($Form1, $zipfile2, $getpath & $readname & ".yail", 0, 5, 1)
				_7ZipDelete($Form1, $zipfile2, $getpath & $getscreen & ".bky", 0, 5, 1)
				_7ZipDelete($Form1, $zipfile2, $getpath & $getscreen & ".scm", 0, 5, 1)
				_7ZipDelete($Form1, $zipfile2, $getpath & $getscreen & ".yail", 0, 5, 1)

				FillList2()

			EndIf
		Case $Aboutmitlink
			ShellExecute("http://appinventor.mit.edu/explore/about-us.html")
		Case $Createlink
			ShellExecute("http://ai2.appinventor.mit.edu/")
		Case $scottlink
			ShellExecute("https://groups.google.com/forum/#!msg/app-inventor-developers-library/kHEFtUiJsQM/obxo_CKizTcJ")
		Case $hosseinlink
			ShellExecute("https://amerkashi.wordpress.com/2014/06/10/ai-screen-manipulation/")
		Case $Emaillink
			If RegRead("HKEY_CURRENT_USER\Software\Classes\mailto\shell\open\command", 1) = 0 Then
				MsgBox(0, "", @TAB & "Send email to Saturnknts@gmail.com" & @CR & "Which I have just copied to your clipboard for convienience :)")
				ClipPut("SaturnKnts@gmail.com")
			Else
				ShellExecute("mailto:saturnknts@gmail.com")
			EndIf
		Case $Button[0]
			Tab1()
		Case $Button[1]
			_GUICtrlTab_SetCurFocus($tab, 1)
		Case $Button[2]
			_GUICtrlTab_SetCurFocus($tab, 2)
		Case $Button[3]
			_GUICtrlTab_SetCurFocus($tab, 3)

		Case $Close
			If $zipfile > 0 Then
				$aiafile = StringTrimRight($zipfile, 4) & ".aia"
				FileMove($zipfile, $aiafile, 1) ;rename the file to aia
			Else
				Directorycleanup()
			EndIf
			Exit
		Case $Close2
			If $zipfile2 > 0 Then
				$aiafile = StringTrimRight($zipfile2, 4) & ".aia"
				FileMove($zipfile2, $aiafile, 1) ;rename the file to aia
			Else
				Directorycleanup()
			EndIf
			Exit
		Case $GUI_EVENT_CLOSE
			If $zipfile > 0 Then
				$aiafile = StringTrimRight($zipfile, 4) & ".aia"
				FileMove($zipfile, $aiafile, 1) ;rename the file to aia
			Else
				Directorycleanup()
			EndIf
			Exit


	EndSwitch

	$aCursorInfo = GUIGetCursorInfo()
	If Not @error Then
		Switch $aCursorInfo[4]
			Case $Aboutmitlink
				If $iBlue Then
					GUICtrlSetColor($Aboutmitlink, 0xFF0000)
					$iBlue = 0
				EndIf
			Case $Createlink
				If $iBlue Then
					GUICtrlSetColor($Createlink, 0xFF0000)
					$iBlue = 0
				EndIf
			Case $scottlink
				If $iBlue Then
					GUICtrlSetColor($scottlink, 0xFF0000)
					$iBlue = 0
				EndIf
			Case $hosseinlink
				If $iBlue Then
					GUICtrlSetColor($hosseinlink, 0xFF0000)
					$iBlue = 0
				EndIf
			Case $Emaillink
				If $iBlue Then
					GUICtrlSetColor($Emaillink, 0xFF0000)
					$iBlue = 0
				EndIf
			Case Else
				If Not $iBlue Then
					GUICtrlSetColor($Aboutmitlink, 0x0000FF)
					GUICtrlSetColor($Createlink, 0x0000FF)
					GUICtrlSetColor($scottlink, 0x0000FF)
					GUICtrlSetColor($hosseinlink, 0x0000FF)
					GUICtrlSetColor($Emaillink, 0x0000FF)
					$iBlue = 1
				EndIf
		EndSwitch
	EndIf
WEnd


Func Pickfile()

	Local Const $sMessage = "Select your Main Project File"
	Local $sFileOpenDialog = FileOpenDialog($sMessage, @UserProfileDir & "Download" & "\", "App Inventor (*.aia;*.zip)");, $FD_FILEMUSTEXIST + $FD_MULTISELECT)
	If @error Then

		MsgBox(0, "", "No file was selected.")
		GUICtrlSetBkColor($PickLabel, $COLOR_RED)
		FileChangeDir(@ScriptDir)
		;Pickfile()

	Else

		FileChangeDir(@ScriptDir)
		$sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)
		GUICtrlSetBkColor($PickLabel, $COLOR_LIME)

	EndIf

	$filechosen = $sFileOpenDialog

EndFunc   ;==>Pickfile

Func Pickfile2()

	Local Const $sMessage = "Select your Main Project File"
	Local $sFileOpenDialog = FileOpenDialog($sMessage, @UserProfileDir & "Download" & "\", "App Inventor (*.aia;*.zip)", $FD_FILEMUSTEXIST + $FD_MULTISELECT)
	If @error Then

		;MsgBox($MB_SYSTEMMODAL, "", "No file was selected.")
		MsgBox(0, "", "No file was selected.")
		GUICtrlSetBkColor($PickLabel2, $COLOR_RED)
		FileChangeDir(@ScriptDir)
		;Pickfile()

	Else

		FileChangeDir(@ScriptDir)
		$sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)
		GUICtrlSetBkColor($PickLabel2, $COLOR_LIME)

	EndIf
	$filechosen2 = $sFileOpenDialog

EndFunc   ;==>Pickfile2

Func FillList()

	GUICtrlSetData($List1, "")
	$pathtostring = _ArrayToString(_ArrayExtract($bkylist, 1, 1))
	$getpath = StringLeft($pathtostring, StringInStr($pathtostring, '\', 0, -1) - 1) & "\"
	;MsgBox($MB_SYSTEMMODAL, "", "" & $getpath)
	$filesonly = _FileListToArray($getpath, "*.bky", $FLTAR_FILES)
	_ArrayTrim($filesonly, 4, 1)
	;_ArrayDisplay($filesonly)
	$filelist = _ArrayToString($filesonly, "|", 1)
	If $filelist = -1 Then
		GUICtrlSetData($List1, "")
	Else
		GUICtrlSetData($List1, $filelist)
	EndIf
	_ArrayDelete($filesonly, 0)
	GUICtrlSetData($CopyButton1, "Copy")
	GUICtrlSetData($copyname, "Enter the New copies name here")
	GUICtrlSetBkColor($copyname, $COLOR_RED)
	GUICtrlSetBkColor($List1, $COLOR_RED)

EndFunc   ;==>FillList

Func FillList2()

	GUICtrlSetData($List2, "")
	$pathtostring = _ArrayToString(_ArrayExtract($bkylist2, 1, 1))
	$getpath = StringLeft($pathtostring, StringInStr($pathtostring, '\', 0, -1) - 1) & "\"
	;MsgBox($MB_SYSTEMMODAL, "", "" & $getpath)
	$filesonly = _FileListToArray($getpath, "*.bky", $FLTAR_FILES)
	_ArrayTrim($filesonly, 4, 1)
	;_ArrayDisplay($filesonly)
	$filelist = _ArrayToString($filesonly, "|", 1)
	GUICtrlSetData($List2, $filelist)
	If $filelist = -1 Then
		GUICtrlSetData($List1, "")
	Else
		GUICtrlSetData($List1, $filelist)
	EndIf
	_ArrayDelete($filesonly, 0)
	GUICtrlSetData($ReNameButton, "Rename")
	GUICtrlSetData($copyname2, "Enter the New name here")
	GUICtrlSetBkColor($copyname2, $COLOR_RED)
	GUICtrlSetBkColor($List2, $COLOR_RED)

EndFunc   ;==>FillList2

Func Directorycleanup()

	DirRemove(@ScriptDir & "\src", 1)
	DirRemove(@ScriptDir & "\assets", 1)
	DirRemove(@ScriptDir & "\youngandroidproject", 1)

EndFunc   ;==>Directorycleanup

Func Tab1() ;copy screens

	$Tabcopy = GUICtrlCreateTabItem("Copy")

	GUICtrlCreatePic(@ScriptDir & "\middlepurple.gif", 0, 0, $guiw * 0.720703125, $guih * 0.9479166666666667)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUISetBkColor(0x8FC202)

	$Selectfile = GUICtrlCreateButton("Select your Project File", (($guiw * 0.720703125) / 2) - 165, 50, 330, 35, $BS_DEFPUSHBUTTON); $BS_MULTILINE, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")

	$PickLabel = GUICtrlCreateLabel("", (($guiw * 0.720703125) / 2) - 165, 100, 330, 35, $WS_BORDER)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlSetBkColor(-1, $COLOR_RED)

	$Label1 = GUICtrlCreateLabel("Highlight the Screen Name you want to make a Copy of", (($guiw * 0.720703125) / 2) - 165, 160, 330, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
	GUICtrlSetBkColor(-1, 0x7C5385)

	$List1 = GUICtrlCreateList("", (($guiw * 0.720703125) / 2) - 165, 180, 330, 100)
	GUICtrlSetData(-1, "")
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	GUICtrlSetBkColor(-1, $COLOR_RED)

	$Label12 = GUICtrlCreateLabel("What would you like the new Screen to be called?", (($guiw * 0.720703125) / 2) - 165, 280, 330, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
	GUICtrlSetBkColor(-1, 0x7C5385)

	$copyname = GUICtrlCreateInput("Enter the New copies name here", (($guiw * 0.720703125) / 2) - 165, 300, 330, 35, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $WS_BORDER))
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	GUICtrlSetBkColor(-1, $COLOR_RED)
	GUICtrlSetTip(-1, "Must start with a letter and have no spaces in the name")

	$CopyButton1 = GUICtrlCreateButton("Copy", (($guiw * 0.720703125) / 2) - 165, 350, 330, 50, $BS_DEFPUSHBUTTON);$BS_MULTILINE, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Close = GUICtrlCreateButton("Close", (($guiw * 0.720703125) / 2) - 76, 425, 153, 33)
	GUICtrlCreateTabItem("")

EndFunc   ;==>Tab1