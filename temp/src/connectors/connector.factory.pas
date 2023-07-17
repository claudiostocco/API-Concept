unit connector.factory;

{$mode Delphi}

interface

uses
    (* System Units *)
    Classes, SysUtils,
    (* Project units *)
    adapter.query.intf, connector.zeos;

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
     class function New<T>(AOwner: TComponent): IQuery;
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
   Result := TZeosConnection.NewConnection(FAOwner,FInstance.FConnection);
end;

{ TQueryFactory }

class function TQueryFactory.New<T>(AOwner: TComponent): IQuery;
begin
   Result := T.Create(AOwner);
end;

class function TQueryFactory.New(AOwner: TComponent; Connection: TComponent): IQuery;
begin
   Result := TQueryFactory.New<TZeosQuery>(AOwner);
   Result.SetConnection(Connection);
end;

class function TQueryFactory.New(AOwner: TComponent): IQuery;
begin
   Result := TQueryFactory.New<TZeosQuery>(AOwner);
   Result.SetConnection(TConnectionFactory.Get);
end;

end.
