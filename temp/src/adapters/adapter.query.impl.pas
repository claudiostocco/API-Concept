unit adapter.query.impl;

{$mode Delphi}

interface

uses
    (* System Units *)
    Classes, SysUtils, DB,
    (* Project units *)
    adapter.query.intf;

type

		{ TQueryFactory }

  TQueryFactory = class
  public
     class function New<T>(AOwner: TComponent; Connection: TComponent): IQuery;
		end;

  { TAbstractQuery }
  TAbstractQuery = class(TInterfacedObject, IQuery)
  protected
    FInternalDataSet: TDataSet;
    FRowsAffected: Integer;
  public
    function AsDataSet: TDataSet;
    function Exec(SQL: String): IQuery; overload; virtual; abstract;
    function Exec: IQuery; overload; virtual; abstract;
    function Insert(SQL: String; UpSert: Boolean=False): IQuery;
    function Open: IQuery;
    function Open(SQL: String): IQuery; overload; virtual; abstract;
    function Select(SQL: String): IQuery virtual; abstract;
    procedure SetConnection(Connection: TComponent); virtual; abstract;
    function SetParamByName(Param: String; Value: Variant): IQuery; virtual; abstract;
    function Update(SQL: String): IQuery;
  published
    property RowsAffected: Integer read FRowsAffected;
  end;

implementation

{ TQueryFactory }

class function TQueryFactory.New<T>(AOwner: TComponent; Connection: TComponent): IQuery;
begin
   Result := T.Create(AOwner);
   Result.SetConnection(Connection);
end;

{ TAbstractQuery }

function TAbstractQuery.AsDataSet: TDataSet;
begin
   Result := FInternalDataSet;
end;

function TAbstractQuery.Insert(SQL: String; UpSert: Boolean): IQuery;
begin
   if UpSert then SQL := 'UPDATE OR '+SQL;
   Result := Select(SQL);
end;

function TAbstractQuery.Open: IQuery;
begin
   FInternalDataSet.Open;
   Result := Self;
end;

function TAbstractQuery.Update(SQL: String): IQuery;
begin
   Result := Select(SQL);
end;

end.
