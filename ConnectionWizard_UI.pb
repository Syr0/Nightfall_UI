Structure WizardWindow
  Hwnd.i
  Wizard_Title.i
  Wizard_Hostname.i
  Wizard_Port.i
  Wizard_Text_Hostname.i
  Wizard_Text_Port.i
  Wizard_Sendstrings.i
  Wizard_Text_Sendstrings.i
  Wizard_Button_Save.i
  Wizard_Button_Cancel.i
EndStructure

Procedure OpenWindow_Wizard(*Window.Wizardwindow, x = 0, y = 0, width = 360, height = 270,flags=#PB_Window_SystemMenu)
  With *Window
    \hwnd = OpenWindow(#PB_Any, x, y, width, height, "Connection Wizard", flags)
    \Wizard_Title = TextGadget(#PB_Any, 10, 10, 260, 20, "Would you like to set up some configuration?")
    \Wizard_Hostname = StringGadget(#PB_Any, 70, 40, 140, 25, "nightfall.org")
    \Wizard_Port = StringGadget(#PB_Any, 240, 40, 60, 25, "4242",#PB_String_Numeric)
    \Wizard_Text_Hostname = TextGadget(#PB_Any, 10, 44, 60, 20, "Hostname: ")
    \Wizard_Text_Port = TextGadget(#PB_Any, 210, 44, 30, 20, "Port: ")
    \Wizard_Sendstrings = EditorGadget(#PB_Any, 10, 110, 340, 110)
    \Wizard_Text_Sendstrings = TextGadget(#PB_Any, 10, 90, 260, 20, "Strings to send after connect (e.g. Login)")
    \Wizard_Button_Save = ButtonGadget(#PB_Any, 20, 230, 100, 25, "Save")
    \Wizard_Button_Cancel = ButtonGadget(#PB_Any, 250, 230, 100, 25, "Cancel")
  EndWith
EndProcedure
; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 18
; Folding = -
; EnableXP
; DPIAware