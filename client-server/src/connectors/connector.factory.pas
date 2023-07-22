unit connector.factory;

{$I ../db/dbcomponent.inc}

{$ifdef FPC}
   {$mode Delphi}
{$endif}

interface

uses
    (* System Units *)
    Classes, SysUtils,
    (* Project units *)
    adapter.query.intf
    {$ifdef USE_ZEOS}
    , connector.zeos
    {$endif}
    {$ifdef USE_FIREDAC}
    , connector.firedac
    {$endif}
    ;

type

  { TConnectionFactory }

  TConnectionFactory = class
  private
     class var FInstance: TConnectionFactory;
     FConnection: TComponent;
     FAOwner: TComponent;
  public
     constructor Create(AOwner: TComponent; Connection: TComponent);
     class function Get: TComponent;
     class function New: TComponent;
  end;

  { TQueryFactory }
  TQueryFactory = class
  private
  public
     class function New(AOwner: TComponent; Connection: TComponent): IQuery; overload;
     class function New(AOwner: TComponent): IQuery; overload;
  end;


implementation

{ TConnectionFactory }

constructor TConnectionFactory.Create(AOwner: TComponent; Connection: TComponent);
begin
   FConnection := Connection;
   FInstance := Self;
   FAOwner := AOwner;
end;

class function TConnectionFactory.Get: TComponent;
begin
   if not Assigned(FInstance) then
      raise ENoConstructException.Create('Not exists instance of the TConnectionFactory class!');
   Result := FInstance.FConnection;
end;

class function TConnectionFactory.New: TComponent;
begin
   if not Assigned(FInstance) then
      raise ENoConstructException.Create('Not exists instance of the TConnectionFactory class!');
   {$ifdef USE_ZEOS}
      Result := TZeosConnection.NewConnection(FAOwner,FInstance.FConnection);
   {$endif}
   {$ifdef USE_FIREDAC}
      Result := TFiredacConnection.NewConnection(FAOwner,FInstance.FConnection);
   {$endif}
end;

{ TQueryFactory }
class function TQueryFactory.New(AOwner: TComponent; Connection: TComponent): IQuery;
begin
   {$ifdef USE_ZEOS}
      Result := TZeosQuery.Create(AOwner);
   {$endif}
   {$ifdef USE_FIREDAC}
      Result := TFiredacQuery.Create(AOwner);
   {$endif}
   Result.SetConnection(Connection);
end;

class function TQueryFactory.New(AOwner: TComponent): IQuery;
begin
   Result := TQueryFactory.New(AOwner, TConnectionFactory.Get);
end;

end.
