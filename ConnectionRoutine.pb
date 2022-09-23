#ReceiveBuffer = 10000
#MaxConsoleLines = 10000

Structure StringLoudCalm
  String.s
  silent.i
  returnidentifyregex.i
  ReturnName.s
EndStructure

Global ReceiveToListMutex = CreateMutex()
Global SendMutex = CreateMutex()
Global NewList ReceivedStrings.s()
Global NewList SendStrings.StringLoudCalm()
Global NewMap SilentResponseInterpreter.s()
Global ConsoleText$ = ""

Procedure SimpleSendServer(String.s)
EndProcedure

Procedure.s SimpleReceiveServer()
EndProcedure

Procedure.s SendQuietServer(String,ResponseRegex)
EndProcedure

Procedure.s FoundSilentResponse(List ReceivedStrings.s(),returnregex.i)
  If IsRegularExpression(returnregex)
    If ListSize(ReceivedStrings()) > 0
      ForEach ReceivedStrings()
        If ExamineRegularExpression(returnregex,ReceivedStrings())
          While NextRegularExpressionMatch(returnregex)
            ProcedureReturn RegularExpressionGroup(returnregex,1)
          Wend
        EndIf
      Next
    EndIf
  EndIf
EndProcedure

Procedure AddConsoleEntry(*Config.Wizardconfig,String.s)
  ConsoleText$ = ConsoleText$ + Trim(String) + #LF$
  NewConsole$ = ""
  If CountString(ConsoleText$,#LF$) > #MaxConsoleLines
    For x = CountString(ConsoleText$,#LF$) - #MaxConsoleLines To #MaxConsoleLines
      NewConsole$ = NewConsole$ + StringField(ConsoleText$,x,#LF$) + #LF$
    Next
    ConsoleText$ = NewConsole$
  EndIf
  SetGadgetText(UI.Mainui\Editor_Output,ConsoleText$)
EndProcedure

Procedure StartConnectionThread(*Config.Wizardconfig)
  Databuffer = AllocateMemory(#ReceiveBuffer)
  connectionhandle = OpenNetworkConnection(*Config\Hostname,*Config\Port,#PB_Network_IPv4 | #PB_Network_TCP)
  If connectionhandle
    Repeat
      If NetworkClientEvent(connectionhandle) = #PB_NetworkEvent_Data
        Response$ = ""
        If ListSize(SendStrings()) > 0
          LockMutex(SendMutex)
          FirstElement(SendStrings())
          SendNetworkString(connectionhandle,SendStrings()\String)
          silent = SendStrings()\silent
          returnregex = SendStrings()\returnidentifyregex
          name.s = SendStrings()\ReturnName
          DeleteElement(SendStrings())
          UnlockMutex(SendMutex)
        EndIf
        
        Repeat
          receivedbytes = ReceiveNetworkData(connectionhandle,Databuffer,#ReceiveBuffer)
          Reponse$ + PeekS(Databuffer,receivedbytes,#PB_UTF8)
        Until receivedbytes < #ReceiveBuffer
        
        LockMutex(ReceiveToListMutex)
        If silent
          AddElement(ReceivedStrings())
          ReceivedStrings() = Reponse$
          group$ = foundsilentresponse(ReceivedStrings(),returnregex)
          If Len(group$) > 0
            silent = 0
            SilentResponseInterpreter(name) = group$
          EndIf
        Else
          AddConsoleEntry(*Config,Reponse$)
        EndIf
        
        UnlockMutex(ReceiveToListMutex)
      EndIf
      Delay(1)
    ForEver
  EndIf
EndProcedure

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 53
; FirstLine = 20
; Folding = n-
; EnableThread
; EnableXP
; DPIAware