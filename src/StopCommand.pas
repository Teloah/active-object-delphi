unit StopCommand;

interface

uses
  ActiveObjectEngine;

type
  TStopCommand = class(TInterfacedObject, ICommand)
  private
    Engine : TActiveObjectEngine;
  public
    constructor Create(aEngine : TActiveObjectEngine);
    procedure Execute();
  end;

implementation

{ TStopCommand }

constructor TStopCommand.Create(aEngine : TActiveObjectEngine);
begin
  inherited Create();
  Engine := aEngine;
end;

procedure TStopCommand.Execute();
begin
  Engine.Stop();
end;

end.
