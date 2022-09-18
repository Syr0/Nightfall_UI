IncludeFile "ConnectionWizard_UI.pb"

Structure Wizardconfig
  Hostname.s
  Port.i
  Strings.s
EndStructure

Procedure CloseWizard(*wizard.WizardWindow)
  With *wizard
    FreeGadget(\Wizard_Button_Cancel)
    FreeGadget(\Wizard_Button_Save)
    FreeGadget(\Wizard_Hostname)
    FreeGadget(\Wizard_Port)
    FreeGadget(\Wizard_Sendstrings)
    FreeGadget(\Wizard_Text_Hostname)
    FreeGadget(\Wizard_Text_Port)
    FreeGadget(\Wizard_Text_Sendstrings)
    FreeGadget(\Wizard_Title)
    CloseWindow(\Hwnd)
  EndWith
EndProcedure

Procedure ReadWizardConfig(*Window_Wizard.WizardWindow,*Config.Wizardconfig)
  *Config\Hostname = GetGadgetText(*Window_Wizard\Wizard_Hostname)
  *Config\Port = Val(GetGadgetText(*Window_Wizard\Wizard_Port))
  *Config\Strings = ReplaceString(RemoveString(GetGadgetText(*Window_Wizard\Wizard_Sendstrings),#CR$)+#LF$,#LF$+#LF$,#LF$)
EndProcedure

Procedure ConnectionWizard(*Config.Wizardconfig)
  Window_Wizard.WizardWindow
  OpenWindow_Wizard(Window_Wizard,0,0,360,270,#PB_Window_SystemMenu|#PB_Window_ScreenCentered)
  StickyWindow(Window_Wizard\Hwnd,1)
  Repeat
    event = WaitWindowEvent(1)
    If EventWindow() = Window_Wizard\Hwnd
      Select event
        Case #PB_Event_CloseWindow
          Close = 1
        Case #PB_Event_Gadget
          Select EventGadget()
            Case Window_Wizard\Wizard_Button_Cancel
              Close = 1
            Case Window_Wizard\Wizard_Button_Save
              ReadWizardConfig(Window_Wizard,*Config)
              Close = 2
          EndSelect
      EndSelect
      
    EndIf
  Until Close
  CloseWizard(Window_Wizard)
  
  If Close = 2
    ProcedureReturn #True
  EndIf
  
EndProcedure
; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 34
; Folding = 9
; EnableXP