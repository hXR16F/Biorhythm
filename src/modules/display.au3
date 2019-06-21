; Programmed by hXR16F
; hXR16F.ar@gmail.com

#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include "Table.au3"

Local $color = String(0x000000)

$file = "output.txt"
FileOpen($file, 0)

For $i = 1 to _FileCountLines($file)
    $line = FileReadLine($file, $i)
	If $i = 1 Then
		Local $yesterday_physical = String($line)
	EndIf
	If $i = 2 Then
		Local $yesterday_emotional = String($line)
	EndIf
	If $i = 3 Then
		Local $yesterday_intellectual = String($line)
	EndIf
	If $i = 4 Then
		Local $today_physical = String($line)
	EndIf
	If $i = 5 Then
		Local $today_emotional = String($line)
	EndIf
	If $i = 6 Then
		Local $today_intellectual = String($line)
	EndIf
	If $i = 7 Then
		Local $tomorrow_physical = String($line)
	EndIf
	If $i = 8 Then
		Local $tomorrow_emotional = String($line)
	EndIf
	If $i = 9 Then
		Local $tomorrow_intellectual = String($line)
	EndIf
	If $i = 10 Then
		Local $color = String($line)
	EndIf
Next
FileClose($file)
FileDelete($file)

$GUI = GUICreate("Biorhythm", 335, 241, -1, -1, -1, 0x2000000)
GUISetState()
GUISetState(@SW_LOCK)
GUICtrlCreateLabel(" Your Biorhythm: ", 7, 7, 100, 13)
$Table2 = _GUICtrlTable_Create(7, 27, 80, 18, 4, 4, 0)
_GUICtrlTable_Set_Justify_All($Table2, 1, 1)
_GUICtrlTable_Set_TextFont_All($Table2, 9.5, 400, 2, "Century Gothic")
_GUICtrlTable_Set_TextFont_Column($Table2, 1, 9.5, 800, 2, "Century Gothic")
_GUICtrlTable_Set_TextFont_Column($Table2, 3, 9.5, 800, 2, "Century Gothic")
_GUICtrlTable_Set_CellColor_Column($Table2, 1, $color)
_GUICtrlTable_Set_Text_Row($Table2, 1, "-|Yesterday|Today|Tomorrow")
_GUICtrlTable_Set_Text_Row($Table2, 2, "Physical|" & $yesterday_physical & "|" & $today_physical & "|" & $tomorrow_physical)
_GUICtrlTable_Set_Text_Row($Table2, 3, "Emotional|" & $yesterday_emotional & "|" & $today_emotional & "|" & $tomorrow_emotional)
_GUICtrlTable_Set_Text_Row($Table2, 4, "Intellectual|" & $yesterday_intellectual & "|" & $today_intellectual & "|" & $tomorrow_intellectual)
_GUICtrlTable_Set_Border_Table($Table2)
$Edit1 = GUICtrlCreateEdit("", 7, 107, 320, 125, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, StringFormat("yesterday_physical:" & $yesterday_physical & "\r\nyesterday_emotional:" & $yesterday_emotional & "\r\nyesterday_intellectual:" & $yesterday_intellectual & "\r\ntoday_physical:" & $today_physical & "\r\ntoday_emotional:" & $today_emotional & "\r\ntoday_intellectual:" & $today_intellectual & "\r\ntomorrow_physical:" & $tomorrow_physical & "\r\ntomorrow_emotional:" & $tomorrow_emotional & "\r\ntomorrow_intellectual:" & $tomorrow_intellectual))
GUICtrlSetBkColor($Edit1, 0xffffff)
GUISetState(@SW_UNLOCK)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd
