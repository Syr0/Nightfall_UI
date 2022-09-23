

;Includes
IncludeFile "ConnectionWizard.pb"
IncludeFile "Config.pb"
IncludeFile "MainUI.pb"
IncludeFile "Map.pb"
IncludeFile "ConnectionRoutine.pb"

UsePNGImageDecoder()

;Load Config
Configurationfile.s = "Connection.config"
Config.Wizardconfig
Global UI.MainUI
Window_Wizard.WizardWindow

If Not LoadConfig(Config,Configurationfile)
  
  ;Create new login
  SaveConfig = ConnectionWizard(Window_Wizard,Config)
  If SaveConfig
    SaveConfig(Config,Configurationfile)
  EndIf
EndIf

ConnectionThread = CreateThread(@StartConnectionThread(),Config)

;Open GUI
MainWindow(UI)

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 14
; EnableXP