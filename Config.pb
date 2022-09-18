Procedure LoadConfig(*Config.Wizardconfig,Configfile.s)
  
  If LoadJSON(0,Configfile)
    ExtractJSONStructure(JSONValue(0), *Config, Wizardconfig)
    FreeJSON(0)
    ProcedureReturn #True
  EndIf
  
EndProcedure
Procedure SaveConfig(*Config.Wizardconfig,Configfile.s)
  If CreateJSON(0)
    InsertJSONStructure(JSONValue(0), *Config, Wizardconfig)
    JsonText.s = ComposeJSON(0, #PB_JSON_PrettyPrint)
    SaveJSON(0,Configfile)
    FreeJSON(0)
  EndIf
EndProcedure

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 16
; Folding = -
; EnableXP