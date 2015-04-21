unit DelayedTyper;

interface

uses
  Classes, ActiveObjectEngine;

type
  TDelayedTyper = class(TInterfacedObject, ICommand)
  private
    Delay : Integer;
    Engine : TActiveObjectEngine;
    OutputList : TStrings;
    Text : string;
    procedure DelayAndRepeat();
  public
    constructor Create(const aDelay : Integer; const aText : string; aEngine : TActiveObjectEngine;
      aOutputList : TStrings);
    procedure Execute();
  end;

implementation

uses
  SleepCommand;

{ TDelayedTyper }

constructor TDelayedTyper.Create(const aDelay : Integer; const aText : string; aEngine : TActiveObjectEngine;
  aOutputList : TStrings);
begin
  inherited Create();
  Delay := aDelay;
  Text := aText;
  Engine := aEngine;
  OutputList := aOutputList;
end;

procedure TDelayedTyper.DelayAndRepeat();
begin
  Engine.AddCommand(TSleepCommand.Create(Delay, Engine, Self));
end;

procedure TDelayedTyper.Execute();
begin
  OutputList.Add(Text);
  DelayAndRepeat();
end;

end.
