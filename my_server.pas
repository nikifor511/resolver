unit my_server;

interface

uses
  System.Win.ScktComp, System.Classes, my_client, Generics.Collections,
  System.SysUtils;

type
  TMy_Server = class(TObject)
    private
      ServerSock: TServerSocket;
      clients: TList<TMy_Client>;

    public
      constructor Ñreate(port: integer);
      destructor Destroy;
      procedure FOnConnect(Sender: TObject; Socket: TCustomWinSocket);
      procedure FOnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
      procedure FOnRead(Sender: TObject; Socket: TCustomWinSocket);
      procedure FOnError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
      procedure Send(message: String; destination: String);
      function IsAnyOneHere(): boolean;

  end;

implementation

uses Unit1;

constructor TMy_Server.Ñreate(port: Integer);
begin
  ServerSock := TServerSocket.Create(nil);
  ServerSock.Port := port;
  ServerSock.OnClientConnect := FOnConnect;
  ServerSock.OnClientDisconnect := FOnDisconnect;
  ServerSock.OnClientRead := FOnRead;
  ServerSock.OnClientError := FOnError;
  ServerSock.Open;
  if ServerSock.Active then
    Form1.RichEdit1.Lines.Add('Server running!');  //TODO FOnListning
  clients := TList<TMy_Client>.Create;
end;

destructor TMy_Server.Destroy;
begin
  ServerSock.Active := false;
end;

procedure TMy_Server.FOnConnect(Sender: TObject; Socket: TCustomWinSocket);
var randomValue, i: integer;
    id_String :String;
    hours, mins, secs, milliSecs : Word;
    tmp_client: TMy_Client;
begin
  id_String := FormatDateTime('ddmmyyyyhhnnsszzz', Now); //dd.mm.yyyy"-"hh:nn:ss:zzz
  DecodeTime(now, hours, mins, secs, milliSecs);
  RandSeed := milliSecs;
  for i := 0 to 4 do begin
    randomValue := Random(62);
    if randomValue < 10 then
      id_String := id_String + IntToStr(randomValue)
    else
      if (randomValue >=10) and (randomValue<36) then
        id_String := id_String + char(randomValue + 55)
      else
        id_String := id_String + char(randomValue + 61);
  end;
  Form1.RichEdit1.Lines.Add('Client connected! __id: ' + id_String);
  Socket.SendText('__id' + id_String);
  tmp_client := TMy_Client.Create;
  tmp_client.set_id(id_String);
  tmp_client.set_sock(Socket);
  tmp_client.set_nickname(copy(id_String, Length(id_String)-4, 5));
  clients.Add(tmp_client);

  Form1.ListBox1.Clear;
  for i := 0 to clients.Count - 1 do
    Form1.ListBox1.Items.Add(clients[i].get_name);


end;

procedure TMy_Server.FOnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
  i: Integer;
begin
  Form1.RichEdit1.Lines.Add('Client diconnected :(');
  for i := 0 to clients.Count - 1 do
    if clients[i].get_sock = Socket then begin
      clients.Delete(i);
      break;
    end;
  Form1.ListBox1.Clear;
  for i := 0 to clients.Count - 1 do
    Form1.ListBox1.Items.Add(clients[i].get_name);

end;

procedure TMy_Server.FOnRead(Sender: TObject; Socket: TCustomWinSocket);
var message: String;
begin
  message := Socket.ReceiveText;
  Form1.RichEdit1.Lines.Add(message);

  {if Copy(message,1,2) = '#N' then begin
     Delete(message,1,2);
     ListBox1.Items.Add(message);
     message := '#U';
     for i := 0 to ListBox1.Items.Count-1 do
      message := message+ListBox1.Items[i]+';';
     for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(message);
     Exit;
    end;
    if (Copy(message,1,2) = '#M')or(Copy(message,1,2) = '#P') then begin
     for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
      ServerSocket1.Socket.Connections[i].SendText(message);
     Exit;
    end;     }
end;

procedure TMy_Server.FOnError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Form1.RichEdit1.Lines.Add('Socket error ('+IntToStr(ErrorCode)+')');
end;

procedure TMy_Server.Send(message: String; destination: String);
var i:integer;
begin
  if destination = '-----' then
    for i := 0 to clients.Count-1 do
      clients[i].Send(message)
    else
      for i := 0 to  clients.Count - 1 do
        if clients[i].get_name = destination then
          clients[i].Send(message);
end;

function TMy_Server.IsAnyOneHere(): boolean;
begin
  if clients.Count > 0 then
    Result := true
  else
    Result := false;
end;

end.
