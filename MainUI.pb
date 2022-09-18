IncludeFile "MainUI_UI.pb"
Procedure MainWindow(*UI.MainUI)
  OpenWindow_MainUI(*UI)
  While IsWindow(*Ui\hwnd)
    event = WaitWindowEvent(1)
    If EventWindow() = *UI\Hwnd
      If event = #PB_Event_Gadget
        Select EventGadget()
        EndSelect
      ElseIf event = #PB_Event_CloseWindow
        Close_MainUI(*UI)
        Break
      EndIf
    EndIf
  Wend
  ProcedureReturn #False
EndProcedure

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 15
; Folding = -
; EnableXP