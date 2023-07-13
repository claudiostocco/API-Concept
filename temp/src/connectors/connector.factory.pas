unit connector.factory;

{$mode Delphi}

interface

uses
    (* System Units *)
    Classes, SysUtils,
    (* Project units *)
    adapter.query.intf, connector.zeos;

type

  { TQueryFactory }
	 TQueryFactory = class
	 private
	    class function New<T>(AOwner: TComponent; Connection: TComponent): IQuery;
	 public
	    class function New(AOwner: TComponent; Connection: TComponent): IQuery;
	 end;


implementation

{ TQueryFactory }

class function TQueryFactory.New<T>(AOwner: TComponent; Connection: TComponent): IQuery;
begin
   Result := T.Create(AOwner);
end;

class function TQueryFactory.New(AOwner: TComponent; Connection: TComponent): IQuery;
begin
   Result := TQueryFactory.New<TZeosQuery>(AOwner, Connection);
   Result.SetConnection(Connection);
end;

end.

