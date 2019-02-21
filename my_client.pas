unit my_client;

interface

uses
  System.Win.ScktComp;

type
  TMy_Client = class

    private
      Sock: TCustomWinSocket;
      id: String;
      nickname: String;


    public
      constructor Ñreate;
      procedure set_id(curr_id: String);
      procedure set_sock(curr_sock: TCustomWinSocket);
      procedure set_nickname(curr_nickname: String);
      function get_id():String;
      function get_sock():TCustomWinSocket;
      function get_name():String;
      procedure Send(message: String);

  end;

implementation

//uses Unit1;

constructor TMy_Client.Ñreate;
begin
  //Form1.RichEdit1.Lines.Add('constructor my_client');
end;

procedure TMy_Client.set_id(curr_id: String);
begin
  self.id := curr_id;
end;

procedure TMy_Client.set_sock(curr_sock: TCustomWinSocket);
begin
  self.Sock := curr_sock;
end;

procedure TMy_Client.set_nickname(curr_nickname: String);
begin
  self.nickname := curr_nickname;
end;

function TMy_Client.get_id():String;
begin
  Result := self.id;
end;

function TMy_Client.get_sock():TCustomWinSocket;
begin
  Result := self.Sock;
end;

function TMy_Client.get_name():String;
begin
  Result := self.nickname;
end;

procedure TMy_Client.Send(message: string);
begin
  self.Sock.SendText(message);
end;


end.
