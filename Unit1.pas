unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls, my_server,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    RichEdit1: TRichEdit;
    Edit1: TEdit;
    ListBox1: TListBox;
    Edit2: TEdit;
    Button4: TButton;
    Label1: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
    serverok: TMy_Server;
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Enabled then
    Edit1.Enabled := false
  else
    Edit1.Enabled := true;
  ListBox1.Items.Clear;
  if serverok = nil then
    serverok := TMy_Server.Ñreate(StrToInt(Edit1.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
var i: integer;
    m: integer;
    hours, mins, secs, milliSecs : Word;
    randomValue: integer;
    randomString :String;
begin
  randomString := FormatDateTime('dd.mm.yyyy"-"hh:nn:ss:zzz', Now);
  DecodeTime(now, hours, mins, secs, milliSecs);
  RandSeed := milliSecs;
  for i := 0 to 4 do begin
    randomValue := Random(62);
    if randomValue < 10 then
      randomString := randomString + IntToStr(randomValue)
    else
      if (randomValue >=10) and (randomValue<36) then
        randomString := randomString + char(randomValue + 55)
      else
        randomString := randomString + char(randomValue + 61);
  end;
  RichEdit1.Lines.Add('Client connected!_' + randomString);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if serverok <> nil then
    serverok.Destroy;
  Application.Terminate;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if serverok.IsAnyOneHere then
    if ListBox1.ItemIndex > -1 then
      serverok.Send(Edit2.Text, ListBox1.Items[ListBox1.ItemIndex])
    else
      serverok.Send(Edit2.Text, '-----');
  Edit2.Text := '';
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if serverok <> nil then
    serverok.Destroy;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  Label1.Caption := IntToStr(ListBox1.ItemIndex);
end;

end.
