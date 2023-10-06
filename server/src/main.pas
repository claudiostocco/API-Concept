unit main;

{$ifdef FPC}
  {$mode delphi}{$H+}
{$endif}

interface

uses
  {$ifdef FPC}
  Classes, SysUtils,
  {$else}
  System.Classes, System.SysUtils,
  {$endif}
  Horse, Horse.HandleException, Horse.CORS,
  controller.routes;

  type

    { TServerMain }

    TServerMain = class
    private
      class var FInstance: TServerMain;
      class function GetInstance: TServerMain;
    public
      class function CreateServer: TServerMain;
      procedure Start;
    end;

implementation

{ TServerMain }

class function TServerMain.GetInstance: TServerMain;
begin
  if FInstance = nil then
    FInstance := TServerMain.Create;
  Result := FInstance;
end;

class function TServerMain.CreateServer: TServerMain;
begin
  THorse.Use(HandleException);
  THorse.Use(CORS);

  THorse.Port := 5000;

  TControllerRoutes.registerRoutes;

  Result := GetInstance;
end;

procedure onListen;
begin
  {$ifdef console}
     WriteLn(Format('Server started on port %d',[THorse.Port]));
  {$endif}
end;

procedure TServerMain.Start;
begin
  THorse.Listen(onListen);
end;

end.

