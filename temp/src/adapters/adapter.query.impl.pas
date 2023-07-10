unit adapter.query.impl;

{$mode Delphi}

interface

uses
    (* System Units *)
    Classes, SysUtils, DB,
    (* Project units *)
    adapter.query.intf;

type

  //IInternalQuery = Interface
  //  property RowsAffected;
  //  property Connection;
  //  property Transaction;
  //  property Params;
  //  property SQL;
  //end;

		{ TQuery }

  TQuery = class(TInterfacedObject, IQuery)
  strict private
    FInternalDataSet: TDataSet;
		public
				function AsDataSet: TDataSet;
				function Insert(SQL: String; UpSert: Boolean=False): IQuery;
				function Open: IQuery;
				function Select(SQL: String): IQuery;
				function SetParamByName(Param: String; Value: Variant): IQuery;
				function Update(SQL: String): IQuery;
  end;

implementation

{ TQuery }

function TQuery.AsDataSet: TDataSet;
begin
   Result := FInternalDataSet;
end;

function TQuery.Insert(SQL: String; UpSert: Boolean): IQuery;
begin
   Result := Self;
end;

function TQuery.Open: IQuery;
begin
   Result := Self;
end;

function TQuery.Select(SQL: String): IQuery;
begin
   Result := Self;
end;

function TQuery.SetParamByName(Param: String; Value: Variant): IQuery;
begin
   Result := Self;
end;

function TQuery.Update(SQL: String): IQuery;
begin
   Result := Self;
end;

end.

