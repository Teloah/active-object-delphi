program ActiveObjectProj;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  ActiveObjectEngine in 'ActiveObjectEngine.pas',
  SleepCommand in 'SleepCommand.pas',
  DelayedTyper in 'DelayedTyper.pas',
  StopCommand in 'StopCommand.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize();
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run();

end.
