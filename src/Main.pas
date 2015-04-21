unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ActiveObjectEngine;

type
  TfrmMain = class(TForm)
    Memo1 : TMemo;
    btnRun : TButton;
    edtStop : TEdit;
    Label1 : TLabel;
    Label2 : TLabel;
    btnStop : TButton;
    procedure btnRunClick(Sender : TObject);
    procedure btnStopClick(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure FormCreate(Sender : TObject);
  private
    Engine : TActiveObjectEngine;
    procedure EngineStopped(Sender : TObject);
    procedure Run();
  end;

var
  frmMain : TfrmMain;

implementation

uses
  DelayedTyper, StopCommand, SleepCommand;

{$R *.dfm}

procedure TfrmMain.btnRunClick(Sender : TObject);
begin
  Engine.AddCommand(TDelayedTyper.Create(100, 'Text #1', Engine, Memo1.Lines));
  Engine.AddCommand(TDelayedTyper.Create(300, 'Text #3', Engine, Memo1.Lines));
  Engine.AddCommand(TDelayedTyper.Create(500, 'Text #5', Engine, Memo1.Lines));
  Engine.AddCommand(TDelayedTyper.Create(700, 'Text #7', Engine, Memo1.Lines));

  Engine.AddCommand(TSleepCommand.Create(StrToInt(edtStop.Text) * 1000, Engine, TStopCommand.Create(Engine)));

  Run();
end;

procedure TfrmMain.btnStopClick(Sender : TObject);
begin
  Engine.Stop();
end;

procedure TfrmMain.EngineStopped(Sender : TObject);
begin
  btnRun.Enabled := True;
  btnStop.Enabled := False;
end;

procedure TfrmMain.FormCreate(Sender : TObject);
begin
  Engine := TActiveObjectEngine.Create();
  Engine.OnStop := EngineStopped;
end;

procedure TfrmMain.FormDestroy(Sender : TObject);
begin
  Engine.Free();
end;

procedure TfrmMain.Run();
begin
  btnRun.Enabled := False;
  btnStop.Enabled := True;
  Memo1.Lines.Clear();

  Engine.Run();
end;

end.
