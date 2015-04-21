unit SleepCommand;

interface

uses
  Windows, SysUtils, ActiveObjectEngine;

type
  TSleepCommand = class(TInterfacedObject, ICommand)
  private
    Engine : TActiveObjectEngine;
    SleepTime : Integer;
    Started : Boolean;
    StartTicks : Cardinal;
    WakeUpCommand : ICommand;
  public
    constructor Create(const aMilliSec : Integer; aEngine : TActiveObjectEngine; aWakeUpCommand : ICommand);
    procedure Execute();
  end;

implementation

{ TSleepCommand }

constructor TSleepCommand.Create(const aMilliSec : Integer; aEngine : TActiveObjectEngine; aWakeUpCommand : ICommand);
begin
  inherited Create();
  Engine := aEngine;
  WakeUpCommand := aWakeUpCommand;
  SleepTime := aMilliSec;
end;

procedure TSleepCommand.Execute();
var
  lElapsed : Integer;
begin
  if Started then begin
    lElapsed := GetTickCount() - StartTicks;
    if lElapsed < SleepTime then
      Engine.AddCommand(Self)
    else
      Engine.AddCommand(WakeUpCommand);
  end
  else begin
    Started := True;
    StartTicks := GetTickCount();
    Engine.AddCommand(Self);
  end;
end;

end.
