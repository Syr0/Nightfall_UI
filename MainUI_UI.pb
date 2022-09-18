Structure MainUI
  hwnd.i
  
  Statusbar.i
  Toolbar.i
  
  ToolbarPrefs.i
  ToolbarReconnect.i
  ToolbarAutomate.i
  ToolbarMap.i
  ToolbarNotes.i
  ToolbarAbout.i
  
  Editor_Output.i
  Editor_Input.i
  
  Canvas_Map.i
  Status.i
  Button_Status_Edit.i
  Text_Status.i
  
  Panel_Notes.i
  
EndStructure
Procedure Close_MainUI(*UI.MainUI)
  With *UI
    FreeGadget(\Editor_Output.i)
    FreeGadget(\Editor_Input.i)
    
    FreeGadget(\Canvas_Map.i)
    FreeGadget(\Status.i)
    FreeGadget(\Button_Status_Edit.i)
    FreeGadget(\Text_Status.i)
    
    FreeGadget(\Panel_Notes.i)
    
    CloseWindow(\hwnd.i)
    
  EndWith
EndProcedure

Procedure ResizeMainUi()
  Debug "TODO: Resize"
EndProcedure


Procedure OpenWindow_MainUI(*UI.MainUI,x = 0, y = 0, width = 1240, height = 710)
  With *UI
    Img_Window_MainUI_0 = LoadImage(#PB_Any,GetCurrentDirectory()+"\Icons\cycle.png")
    Img_Window_MainUI_1 = LoadImage(#PB_Any,GetCurrentDirectory()+"\Icons\guide-book.png")
    Img_Window_MainUI_2 = LoadImage(#PB_Any,GetCurrentDirectory()+"\Icons\info.png")
    Img_Window_MainUI_3 = LoadImage(#PB_Any,GetCurrentDirectory()+"\Icons\settings.png")
    Img_Window_MainUI_4 = LoadImage(#PB_Any,GetCurrentDirectory()+"\Icons\stress-test.png")
    Img_Window_MainUI_5 = LoadImage(#PB_Any,GetCurrentDirectory()+"\Icons\treasure-map.png")
    
    \hwnd = OpenWindow(#PB_Any, x, y, width, height, "", #PB_Window_SystemMenu | #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
    SetWindowColor(\hwnd, RGB(192,192,192))  
    BindEvent(#PB_Event_SizeWindow, @ResizeMainUi(),\hwnd)
    
    \ToolbarPrefs = 1000
    \ToolbarReconnect = 1001
    \ToolbarAutomate = 1002
    \ToolbarMap = 1003
    \ToolbarNotes = 1004
    \ToolbarAbout = 1005
    \Toolbar = CreateToolBar(#PB_Any, WindowID(\hwnd))
    ToolBarImageButton(\ToolbarPrefs,ImageID(Img_Window_MainUI_3))
    ToolBarToolTip(\Toolbar, \ToolbarPrefs, "Preferences")
    ToolBarImageButton(\ToolbarReconnect,ImageID(Img_Window_MainUI_0))
    ToolBarToolTip(\Toolbar, \ToolbarReconnect, "Reconnect")
    ToolBarImageButton(\ToolbarAutomate,ImageID(Img_Window_MainUI_4))
    ToolBarToolTip(\Toolbar, \ToolbarAutomate, "Automate")
    ToolBarSeparator()
    ToolBarImageButton(\ToolbarMap,ImageID(Img_Window_MainUI_1), #PB_ToolBar_Toggle)
    ToolBarToolTip(\Toolbar, \ToolbarMap, "Map")
    ToolBarImageButton(\ToolbarNotes,ImageID(Img_Window_MainUI_5), #PB_ToolBar_Toggle)
    ToolBarToolTip(\Toolbar, \ToolbarNotes, "Notes")
    ToolBarSeparator()
    ToolBarImageButton(\ToolbarAbout,ImageID(Img_Window_MainUI_2))
    ToolBarToolTip(\Toolbar,  \ToolbarAbout, "About")
    
    \Statusbar = CreateStatusBar(#PB_Any, WindowID(\hwnd))
    AddStatusBarField(300)
    StatusBarText(\Statusbar, 0, "Label")
    AddStatusBarField(800)
    StatusBarProgress(\Statusbar, 1, 0)
    AddStatusBarField(150)
    StatusBarText(\Statusbar, 2, "Label")
    
    \Editor_Output = EditorGadget(#PB_Any, 430, ToolBarHeight(\Toolbar) + 0, 470, 640, #PB_Editor_ReadOnly)
    SetGadgetColor(\Editor_Output, #PB_Gadget_FrontColor,RGB(0,255,0))
    SetGadgetColor(\Editor_Output, #PB_Gadget_BackColor,RGB(0,0,0))
    
    \Editor_Input = EditorGadget(#PB_Any, 430, ToolBarHeight(\Toolbar) + 640, 470, 20)
    SetGadgetColor(\Editor_Input, #PB_Gadget_FrontColor,RGB(0,128,255))
    SetGadgetColor(\Editor_Input, #PB_Gadget_BackColor,RGB(0,0,0))
    
    \Canvas_Map = CanvasGadget(#PB_Any, 900, ToolBarHeight(\Toolbar) + 0, 340, 660)
    \Status = EditorGadget(#PB_Any, 0, ToolBarHeight(\Toolbar) + 320, 430, 340)
    \Button_Status_Edit = ButtonGadget(#PB_Any, 390, ToolBarHeight(\Toolbar) + 300, 40, 20, "Edit")
    \Text_Status = TextGadget(#PB_Any, 0, ToolBarHeight(\Toolbar) + 300, 390, 20, "Status:")
    
    \Panel_Notes = PanelGadget(#PB_Any, 0, ToolBarHeight(\Toolbar) + 0, 430, 300)
    AddGadgetItem(\Panel_Notes, -1, "Global Notes")
    AddGadgetItem(\Panel_Notes, -1, "Room")
    AddGadgetItem(\Panel_Notes, -1, "NPC")
    AddGadgetItem(\Panel_Notes, -1, "Item")
    CloseGadgetList()
  EndWith
EndProcedure
; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 42
; FirstLine = 4
; Folding = 7
; EnableXP