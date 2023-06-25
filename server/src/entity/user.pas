unit user;

{$mode Delphi}

interface

uses
  Classes, SysUtils;

  type

    { TUser }

    TUser = class
      private
        Femail: String;
        Fid: String;
        Fname: String;
        procedure Setemail(AValue: String);
        procedure Setid(AValue: String);
        procedure Setname(AValue: String);
      public
        constructor Create(id, name, email: String);
      published
        property id: String read Fid write Setid;
        property name: String read Fname write Setname;
        property email: String read Femail write Setemail;
    end;

implementation

{ TUser }

procedure TUser.Setemail(AValue: String);
begin
  if Femail=AValue then Exit;
  Femail:=AValue;
end;

procedure TUser.Setid(AValue: String);
begin
  if Fid=AValue then Exit;
  Fid:=AValue;
end;

procedure TUser.Setname(AValue: String);
begin
  if Fname=AValue then Exit;
  Fname:=AValue;
end;

constructor TUser.Create(id, name, email: String);
begin
  Fid := id;
  Fname := name;
  Femail := email;
end;

end.

