program server;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  my_client in 'my_client.pas',
  my_server in 'my_server.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
