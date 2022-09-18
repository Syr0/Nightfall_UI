;Includes
IncludeFile "ConnectionWizard.pb"
IncludeFile "Config.pb"
IncludeFile "MainUI.pb"
IncludeFile "Map.pb"

UsePNGImageDecoder()

;Load Config
Configurationfile.s = "Connection.config"
Config.Wizardconfig
If Not LoadConfig(Config,Configurationfile)
  
  ;Create new login
  SaveConfig = ConnectionWizard(Config)
  If SaveConfig
    SaveConfig(Config,Configurationfile)
  EndIf
EndIf

;Open GUI
UI.MainUI
MainWindow(UI)

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 4
; EnableXP