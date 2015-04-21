unit ActiveObjectEngine;

interface

uses
  Classes, Forms, Generics.Collections;

type
  ICommand = interface
    procedure Execute();
  end;

  TActiveObjectEngine = class
  private
    Commands : TList<ICommand>;
    FOnStop : TNotifyEvent;
    Running : Boolean;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure AddCommand(command : ICommand);
    procedure Run();
    procedure Stop();
    property OnStop : TNotifyEvent read FOnStop write FOnStop;
  end;

implementation

{ TActiveObjectEngine }

constructor TActiveObjectEngine.Create();
begin
  inherited;
  Commands := TList<ICommand>.Create();
end;

destructor TActiveObjectEngine.Destroy();
begin
  Commands.Free();
  inherited;
end;

procedure TActiveObjectEngine.AddCommand(command : ICommand);
begin
  Commands.Add(command);
end;

procedure TActiveObjectEngine.Run();
var
  lCommand : ICommand;
begin
  Running := True;
  while (Commands.Count > 0) and Running do begin
    lCommand := Commands[0];
    Commands.Extract(lCommand);
    lCommand.Execute();
    Application.ProcessMessages();
  end;
end;

procedure TActiveObjectEngine.Stop();
begin
  Running := False;
  Commands.Clear();
  if Assigned(FOnStop) then
    FOnStop(Self);
end;

end.
